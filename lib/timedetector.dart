import 'dart:async';
import 'dart:developer';
import 'package:intl/intl.dart';

class TimeDetector {

  TimeDetector._() {
    _periodicDuration = DEFAULT_DURATION;
    _comparingFormat = DATE_FORMAT;
    _formatter = DateFormat(DATE_FORMAT);
    repeatDuration(value: DEFAULT_REPEAT_DURATION);
    _initTimer();
  }

  static final TimeDetector instance = TimeDetector._();

  Timer? _timer;

  Function(DateTime)? _onChanged;

  void setChanged({required Function(DateTime) onChanged}) {
    _onChanged = onChanged;
  }

  static const String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
  static const Duration DEFAULT_DURATION = Duration(seconds: 1);
  static const Duration DEFAULT_REPEAT_DURATION = Duration(days: 1);
  late Duration _periodicDuration;

  DateTime? _comparisonTime;

  late String _comparingFormat;
  late DateFormat _formatter;
  late Duration _updateDuration;

  bool _enableLog = false;

  String get comparingFormat => _comparingFormat;

  /// ONCE TIME HAS REACHED THIS DURATION
  /// WILL USED TO UPDATE NEW COMPARE TIME
  /// DEFAULT [DEFAULT_REPEAT_DURATION]
  void repeatDuration({Duration value = DEFAULT_REPEAT_DURATION}) {
    _updateDuration = value;
    _log("UPDATE_DURATION_SET $_updateDuration");
  }

  /// ENABLE CONSOLE LOGS
  set enableLog(bool value) {
    _enableLog = value;
    _log("LOG-ENABLED");
  }

  /// SPECIFIC FORMAT TO COMPARE DATE VALUE
  set comparingFormat(String value) {
    _comparingFormat = value;
    _formatter = DateFormat(value);
  }

  /// COMPARING GIVEN VALUE WITH CURRENT TIME
  void setComparison({required DateTime input}) {
    final now = DateTime.now();
    if (input.isBefore(now)) {
      _log("BEFORE TIME NOT ACCEPTABLE");
      return;
    }
    _comparisonTime = input;
    _log("INPUT-TIME $_comparisonTime");
  }

  /// CHANGE DURATION FOR TIMER PERIODIC
  void changeDuration({Duration duration = DEFAULT_DURATION}) {
    _periodicDuration = duration;
    stopTimer();
    reStartTimer();
  }

  /// KILLING TIMER
  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// IF TIMER NULL / TIMER IS NOT IN ACTIVE ONLY WILL MAKE NEW TIMER
  void reStartTimer() {
    if (_timer != null && (_timer?.isActive ?? false)) {
      _initTimer();
    }
  }

  void _initTimer() {
    _timer = Timer.periodic(_periodicDuration, (timer) {
      if (_comparisonTime != null) {
        var currentTime = _convert(DateTime.now());
        if (currentTime.isAtSameMomentAs(_convert(_comparisonTime!))) {
          _log("TIME_MATCHED");
          setComparison(input: _comparisonTime!.add(_updateDuration));
          _onChanged?.call(currentTime);
        }
      }
    });
  }

  /// LOGS WILL PRINT ONLY ON DEBUG MODE [_enableLog] ENABLED
  void _log(dynamic message) {
    if (_enableLog) {
      log("$message", name: "TIME-DETECTOR", time: DateTime.now());
    }
  }

  DateTime _convert(DateTime input) {
    var value = _formatter.format(input);
    return DateTime.parse(value);
  }
}

final timeDetector = TimeDetector.instance;