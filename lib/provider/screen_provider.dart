import 'package:flutter_responsive_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  String _title = 'Dashboard';
  String get title => _title;

  Widget _screen = DashboardScreen();
  Widget get screen => _screen;

  changeScreen(String title, Widget widget) {
    _title = title;
    _screen = widget;
    notifyListeners();
  }
}
