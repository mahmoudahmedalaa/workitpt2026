import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

extension DateTimeExtension on DateTime {
  String getFormattedDate() {
    try {
      final formatter = DateFormat('MMM dd, yyyy');
      final formatted = formatter.format(this);
      return formatted;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return '';
    }
  }

  static int? _estToUtcDifference = 0;
  bool get isToday {
    DateTime dateTime = DateTime.now();
    return (this.year == dateTime.year &&
        this.month == dateTime.month &&
        this.day == dateTime.day);
  }

  bool isSameDate(DateTime dateTime) {
    return (this.year == dateTime.year &&
        this.month == dateTime.month &&
        this.day == dateTime.day);
  }

  int _getESTtoUTCDifference() {
    if (_estToUtcDifference == null) {
      tz.initializeTimeZones();
      final locationNY = tz.getLocation('Kathmandu');
      tz.TZDateTime nowNY = tz.TZDateTime.now(locationNY);
      _estToUtcDifference = nowNY.timeZoneOffset.inMinutes;
    }

    return _estToUtcDifference!;
  }

  String getFormattedDateOnly() {
    try {
      final formatter = DateFormat('dd MMM');
      final formatted = formatter.format(this);
      return formatted;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return '';
    }
  }

  DateTime toESTzone() {
    DateTime result = this.toUtc(); // local time to UTC
    result = result.add(Duration(
        minutes: _getESTtoUTCDifference() - 30 + 720)); // convert UTC to EST
    return result;
  }

  String getExpiryYear() {
    try {
      final formatter = DateFormat('yy');
      final formatted = formatter.format(this);
      return formatted;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return '';
    }
  }

  String getExpiryMonth() {
    try {
      final formatter = DateFormat('MM');
      final formatted = formatter.format(this);
      return formatted;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return '';
    }
  }

  String getFormattedDateWithTime() {
    try {
      final formatter = DateFormat('hh:mm a');
      final formatted = formatter.format(this);
      return formatted;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return '';
    }
  }

  bool isAtLeastYearsOld(int years) {
    final now = DateTime.now();
    final boundaryDate = DateTime(now.year - years, now.month, now.day);

    // Discard the time from [this].
    final thisDate = DateTime(year, month, day);

    // Did [thisDate] occur on or before [boundaryDate]?
    return thisDate.compareTo(boundaryDate) <= 0;
  }

  String timeAgo({bool numericDates = false}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1w' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1d' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1h' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}m';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1m' : 'a minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s';
    } else {
      return 'Just now';
    }
  }
}

String formatUTCDate(String date) {
  final inputFormat =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"); //2021-08-31T01:29:33.349Z
  final inputDate = inputFormat.parse(date);
  final outputFormat = DateFormat('hh:mm a');
  final outputDate = outputFormat.format(inputDate);
  return outputDate;
}

DateTime formatDate(String date) {
  final inputFormat = DateFormat('yyyy-MM-dd hh:mm');
  final inputDate = inputFormat.parse(date);
  return inputDate;
}

DateTime formatDateOnly(String date) {
  final inputFormat = DateFormat('dd-MM-yyyy');
  final inputDate = inputFormat.parse(date);
  return inputDate;
}
