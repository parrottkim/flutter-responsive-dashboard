import 'dart:io';

import 'package:flutter_responsive_dashboard/provider/menu_provider.dart';
import 'package:flutter_responsive_dashboard/provider/screen_provider.dart';
import 'package:flutter_responsive_dashboard/provider/theme_provider.dart';
import 'package:flutter_responsive_dashboard/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Flutter Responsive Dashboard');
    setWindowMinSize(const Size(600.0, 600.0));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => ScreenProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Responsive Dashboard',
            theme: value.darkTheme ? dark : light,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
