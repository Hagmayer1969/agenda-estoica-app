import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/stoic_quote.dart';

class QuoteProvider extends ChangeNotifier {
  late Box<StoicQuote> _quoteBox;
  List<StoicQuote> _quotes = [];
  StoicQuote? _dailyQuote;
  final Random _random = Random();

  QuoteProvider() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _quoteBox = Hive.box<StoicQuote>('quotes');
    _loadQuotes();
    _loadDailyQuote();
  }

  void _loadQuotes() {
    _quotes = _quoteBox.values.toList();
    notifyListeners();
  }

  void _loadDailyQuote() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    // Check if we already have a quote for today
    final todayQuotes = _quotes.where((quote) {
      if (quote.lastShown == null) return false;
      final lastShown = DateTime(
        quote.lastShown!.year,
        quote.lastShown!.month,
        quote.lastShown!.day,
      );
      return lastShown == today;
    }).toList();

    if (todayQuotes.isNotEmpty) {
      _dailyQuote = todayQuotes.first;
    } else if (_quotes.isNotEmpty) {
      // Select a random quote for today
      _dailyQuote = _quotes[_random.nextInt(_quotes.length)];
      _updateLastShown(_dailyQuote!.id);
    }
    notifyListeners();
  }

  List<StoicQuote> get quotes => _quotes;
  StoicQuote? get dailyQuote => _dailyQuote;

  List<StoicQuote> get favoriteQuotes =>
      _quotes.where((quote) => quote.isFavorite).toList();

  List<StoicQuote> getQuotesByAuthor(String author) {
    return _quotes
        .where((quote) =>
            quote.author.toLowerCase().contains(author.toLowerCase()))
        .toList();
  }

  List<StoicQuote> getQuotesByTheme(String theme) {
    return _quotes
        .where((quote) =>
            quote.themes.any((t) => t.toLowerCase() == theme.toLowerCase()))
        .toList();
  }

  Future<void> addQuote(StoicQuote quote) async {
    await _quoteBox.put(quote.id, quote);
    _loadQuotes();
  }

  Future<void> updateQuote(StoicQuote quote) async {
    await _quoteBox.put(quote.id, quote);
    _loadQuotes();
  }

  Future<void> deleteQuote(String id) async {
    await _quoteBox.delete(id);
    _loadQuotes();
    if (_dailyQuote?.id == id) {
      _loadDailyQuote();
    }
  }

  Future<void> toggleFavorite(String id) async {
    final quote = _quoteBox.get(id);
    if (quote != null) {
      final updatedQuote = quote.copyWith(isFavorite: !quote.isFavorite);
      await _quoteBox.put(id, updatedQuote);
      _loadQuotes();
      if (_dailyQuote?.id == id) {
        _dailyQuote = updatedQuote;
        notifyListeners();
      }
    }
  }

  Future<void> _updateLastShown(String id) async {
    final quote = _quoteBox.get(id);
    if (quote != null) {
      final updatedQuote = quote.copyWith(lastShown: DateTime.now());
      await _quoteBox.put(id, updatedQuote);
      _loadQuotes();
    }
  }

  StoicQuote? getRandomQuote() {
    if (_quotes.isEmpty) return null;
    return _quotes[_random.nextInt(_quotes.length)];
  }

  void refreshDailyQuote() {
    _loadDailyQuote();
  }
}
