import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';
import 'package:naw3ia/features/calendar/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/utils/app_assets.dart';

class ModernCalendar extends StatefulWidget {
  final List<CalendarEvent> events;
  final String locale;
  final Function(CalendarEvent) onEventTap;

  const ModernCalendar({
    super.key,
    required this.events,
    required this.locale,
    required this.onEventTap,
  });

  @override
  State<ModernCalendar> createState() => _ModernCalendarState();
}

class _ModernCalendarState extends State<ModernCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late Map<DateTime, List<CalendarEvent>> _eventsByDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _groupEventsByDay();
  }

  void _groupEventsByDay() {
    _eventsByDay = {};
    for (var event in widget.events) {
      final date = DateTime(
        event.date.year,
        event.date.month,
        event.date.day,
      );
      if (_eventsByDay[date] == null) {
        _eventsByDay[date] = [];
      }
      _eventsByDay[date]!.add(event);
    }
    // Debug print to verify event grouping
  }

  List<CalendarEvent> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final events = _eventsByDay[normalizedDay] ?? [];
    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(16.w),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TableCalendar<CalendarEvent>(
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime(2026, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.saturday,
            weekendDays: const [DateTime.friday],
            eventLoader: _getEventsForDay,
            locale: widget.locale,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isNotEmpty) {
                  return Positioned(
                    bottom: 1,
                    child: Container(
                      height: 6.h,
                      width: 6.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (events.first).color,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                size: 28.sp,
                color: Theme.of(context).primaryColor,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                size: 28.sp,
                color: Theme.of(context).primaryColor,
              ),
            ),
            calendarStyle: CalendarStyle(
              markersMaxCount: 4,
              markerSize: 8.w,
              markerDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              weekendTextStyle: TextStyle(
                color: Colors.red[300],
              ),
              outsideDaysVisible: false,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              // Debug print to verify selection
            },
          ),
        ),
        Expanded(
          child: _buildEventsList(),
        ),
      ],
    );
  }

  Widget _buildEventsList() {
    final events = _getEventsForDay(_selectedDay);
    if (events.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Lottie.asset(Assets.imagesSearchFailLottie,width: 190.w),
            Text(
              'calendar.no_events'.tr(context),
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12.h),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: InkWell(
            onTap: () => widget.onEventTap(event),
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 4.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: event.color,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: event.color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                event.getCategory(widget.locale),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: event.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              DateFormat.Hm().format(event.date),
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          event.getTitle(widget.locale),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (event.getDescription(widget.locale) != null) ...[
                          SizedBox(height: 4.h),
                          Text(
                            event.getDescription(widget.locale)!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                        if (event.link != null) ...[
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => widget.onEventTap(event),
                                child: Text(
                                  'calendar.view_details'.tr(context),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: event.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
