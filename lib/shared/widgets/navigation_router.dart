import 'package:flutter/widgets.dart';

/// A global [RouteObserver] for listening to route changes across the app.
///
/// Use this in [MaterialApp.navigatorObservers] and subscribe in widgets
/// to detect route push, pop, etc.
final RouteObserver<ModalRoute<dynamic>> routeObserver = RouteObserver<ModalRoute<dynamic>>();
