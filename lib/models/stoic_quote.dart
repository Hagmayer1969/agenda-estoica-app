import 'package:hive/hive.dart';

part 'stoic_quote.g.dart';

@HiveType(typeId: 2)
class StoicQuote extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String text;

  @HiveField(2)
  String author;

  @HiveField(3)
  String? source;

  @HiveField(4)
  List<String> themes;

  @HiveField(5)
  bool isFavorite;

  @HiveField(6)
  DateTime? lastShown;

  StoicQuote({
    required this.id,
    required this.text,
    required this.author,
    this.source,
    List<String>? themes,
    this.isFavorite = false,
    this.lastShown,
  }) : themes = themes ?? [];

  StoicQuote copyWith({
    String? id,
    String? text,
    String? author,
    String? source,
    List<String>? themes,
    bool? isFavorite,
    DateTime? lastShown,
  }) {
    return StoicQuote(
      id: id ?? this.id,
      text: text ?? this.text,
      author: author ?? this.author,
      source: source ?? this.source,
      themes: themes ?? this.themes,
      isFavorite: isFavorite ?? this.isFavorite,
      lastShown: lastShown ?? this.lastShown,
    );
  }
}
