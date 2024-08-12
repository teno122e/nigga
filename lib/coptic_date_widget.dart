import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for DateFormat

class CopticDateWidget extends StatefulWidget {
  @override
  _CopticDateWidgetState createState() => _CopticDateWidgetState();
}

class _CopticDateWidgetState extends State<CopticDateWidget> {
  String _copticDate = '';
  String _gregorianDate = '';

  @override
  void initState() {
    super.initState();
    _updateDates();
    Timer.periodic(Duration(seconds: 1), (timer) {
      _updateDates();
    });
  }

  void _updateDates() {
    final now = DateTime.now();
    final copticDate = _convertToCopticDate(now);
    final gregorianDate = DateFormat('EEEE, MMMM d, yyyy', 'en_US').format(now);
    setState(() {
      _copticDate = copticDate;
      _gregorianDate = gregorianDate;
    });
  }

  String _convertToCopticDate(DateTime date) {
    final a = ((14 - date.month) / 12).floor();
    final m = date.month + 12 * a - 3;
    final y = date.year + (4800 - a) - 1;
    final jdn = date.day + ((153 * m + 2) / 5).floor() + 365 * y + (y / 4).floor() - (y / 100).floor() + (y / 400).floor() - 32045;
    final copticEpoch = 1824665;
    final copticJdn = jdn - copticEpoch;
    final copticYear = (copticJdn / 365.25).floor();
    final copticDayOfYear = copticJdn - (copticYear * 365.25).floor();
    final copticMonth = (copticDayOfYear / 30).floor() + 1;
    final copticDay = copticDayOfYear - (copticMonth - 1) * 30;

    final copticMonthNames = [
      'Toot', 'Baba', 'Hatoor', 'Kiahk', 'Tooba', 'Amshir', 'Baramhat', 'Baramouda', 'Bashans', 'Baouna', 'Abeeb', 'Mesra', 'Nasie'
    ];
    final copticMonthName = copticMonthNames[copticMonth - 1];

    return '${copticDay + 1} $copticMonthName ${copticYear + 1}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _gregorianDate,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4),
        Text(
          _copticDate,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
