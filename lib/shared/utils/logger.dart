import 'dart:developer';
import 'package:flutter/foundation.dart';

class Log {
  static const String _prefix = 'HomeKru Owner';
  static const String _errorSymbol = '❌';
  static const String _stackSymbol = '🧵';

  static void _print(String symbol, dynamic message, {String? tag}) {
    log('$_prefix $symbol ${tag ?? ""} $message');
  }

  static void d(dynamic message, {String? tag}) {
    if (kDebugMode) _print('🐞', message, tag: tag);
  }

  static void i(dynamic message, {String? tag}) {
    if (kDebugMode) _print('ℹ️', message, tag: tag);
  }

  static void w(dynamic message, {String? tag}) {
    if (kDebugMode) _print('⚠️', message, tag: tag);
  }

  static void e(
    dynamic message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
  }) {
    _print('❌', message, tag: tag);
    if (error != null) log('$_prefix $_errorSymbol $error');
    if (stackTrace != null) log('$_prefix $_stackSymbol $stackTrace');
  }
}
