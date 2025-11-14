import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  DateTime startDate;

  @HiveField(4)
  DateTime? endDate;

  @HiveField(5)
  bool isAllDay;

  @HiveField(6)
  String? location;

  @HiveField(7)
  bool hasReminder;

  @HiveField(8)
  int? reminderMinutesBefore;

  @HiveField(9)
  String? calendarId;

  @HiveField(10)
  String? stoicPrinciple;

  Event({
    required this.id,
    required this.title,
    this.description,
    required this.startDate,
    this.endDate,
    this.isAllDay = false,
    this.location,
    this.hasReminder = false,
    this.reminderMinutesBefore,
    this.calendarId,
    this.stoicPrinciple,
  });

  Event copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    bool? isAllDay,
    String? location,
    bool? hasReminder,
    int? reminderMinutesBefore,
    String? calendarId,
    String? stoicPrinciple,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAllDay: isAllDay ?? this.isAllDay,
      location: location ?? this.location,
      hasReminder: hasReminder ?? this.hasReminder,
      reminderMinutesBefore: reminderMinutesBefore ?? this.reminderMinutesBefore,
      calendarId: calendarId ?? this.calendarId,
      stoicPrinciple: stoicPrinciple ?? this.stoicPrinciple,
    );
  }
}
