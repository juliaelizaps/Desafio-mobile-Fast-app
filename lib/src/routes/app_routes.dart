import 'package:flutter/material.dart';
import '../modules/initial/page/initial_page.dart';
import '../modules/home/page/home_page.dart';
import '../modules/history/page/history_page.dart';

class Routes {
  static const String initial = '/';
  static const String home = '/home';
  static const String history = '/history';
}

class AppRoutes {
  static final routes = {
    Routes.initial: (context) => InitialPage(),
    Routes.home: (context) => HomePage(),
    Routes.history: (context) => HistoryPage(),
  };
}
