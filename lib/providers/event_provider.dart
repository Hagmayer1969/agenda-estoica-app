import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/event.dart';

class EventProvider extends ChangeNotifier {
  late Box<Event> _eventBox;
  List<Event> _events = [];
  final Uuid _uuid = const Uuid();

  EventProvider() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _eventBox = Hive.box<Event>('events');
    _loadEvents();
  }

  void _loadEvents() {
    _events = _eventBox.values.toList();
    _events.sort((a, b) => a.startDate.compareTo(b.startDate));
    notifyListeners();
  }

  List<Event> get events => _events;

  List<Event> getEventsForDay(DateTime day) {
    return _events.where((event) {
      final eventDate = event.startDate;
      return eventDate.year == day.year &&
          eventDate.month == day.month &&
          eventDate.day == day.day;
    }).toList();
  }

  List<Event> getEventsForMonth(DateTime month) {
    return _events.where((event) {
      final eventDate = event.startDate;
      return eventDate.year == month.year && eventDate.month == month.month;
    }).toList();
  }

  List<Event> getUpcomingEvents({int days = 7}) {
    final now = DateTime.now();
    final futureDate = now.add(Duration(days: days));
    
    return _events.where((event) {
      return event.startDate.isAfter(now) &&
          event.startDate.isBefore(futureDate);
    }).toList();
  }

  Future<void> addEvent(Event event) async {
    final newEvent = Event(
      id: _uuid.v4(),
      title: event.title,
      description: event.description,
      startDate: event.startDate,
      endDate: event.endDate,
      isAllDay: event.isAllDay,
      location: event.location,
      hasReminder: event.hasReminder,
      reminderMinutesBefore: event.reminderMinutesBefore,
      calendarId: event.calendarId,
      stoicPrinciple: event.stoicPrinciple,
    );
    
    await _eventBox.put(newEvent.id, newEvent);
    _loadEvents();
  }

  Future<void> updateEvent(Event event) async {
    await _eventBox.put(event.id, event);
    _loadEvents();
  }

  Future<void> deleteEvent(String id) async {
    await _eventBox.delete(id);
    _loadEvents();
  }

  bool hasEventsOnDay(DateTime day) {
    return _events.any((event) {
      final eventDate = event.startDate;
      return eventDate.year == day.year &&
          eventDate.month == day.month &&
          eventDate.day == day.day;
    });
  }

  int getEventCountForDay(DateTime day) {
    return getEventsForDay(day).length;
  }
}
