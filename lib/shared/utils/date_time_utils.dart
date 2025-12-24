import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  /// Format: 2025-05-25
  static String formatDate(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// Format: 2025-25-05
  static String formatDateWithDash(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// Format: 05/25/2025
  static String formatDateSlash(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  static DateTime parseDateSlash(String date) {
    return DateFormat('MM/dd/yyyy').parse(date);
  }

  /// Format: 25 May 2025
  static String formatReadableDate(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  /// Format: 05:47 PM
  static String formatTime12Hour(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat('hh:mm a').format(dateTime);
  }

  /// Format: 2025-05-25 – 17:47
  static String formatFullShort(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  }

  /// Format: Sunday, May 25, 2025 at 5:47:45 PM
  static String formatFullLong(String date) {
    final dateTime = DateTime.parse(date);

    return DateFormat.yMMMMEEEEd().add_jms().format(dateTime);
  }

  /// Format: dd MMM yyyy, hh:mm a (e.g. 25 May 2025, 05:47 PM)
  static String formatDateTimeReadable(String date) {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }

  /// Parse from String like "2025-05-25 17:47:45"
  static DateTime parseFromString(String dateTimeStr) {
    return DateTime.parse(dateTimeStr);
  }

  static TimeOfDay parseFormattedTime(String timeStr) {
    final dt = DateFormat.jm().parse(timeStr); // parses "2:30 PM"
    return TimeOfDay(hour: dt.hour, minute: dt.minute);
  }

  static String formatTimeOfDayTo12Hour(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // "2:30 PM"
  }

  static DateTime getDateOnly(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
