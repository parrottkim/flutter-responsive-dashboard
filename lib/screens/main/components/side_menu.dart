import 'package:flutter_responsive_dashboard/provider/screen_provider.dart';
import 'package:flutter_responsive_dashboard/provider/theme_provider.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/first_screen.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/gallery_screen.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/second_screen.dart';
import 'package:flutter_responsive_dashboard/screens/main/components/main_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _currentIndex = 0;

  final List<dynamic> _drawerItems = [
    {
      'icon': 'assets/icons/dashboard.svg',
      'title': 'Dashboard',
      'route': DashboardScreen(),
    },
    {},
    {
      'icon': 'assets/icons/starcraft-remastered.svg',
      'title': 'Starcraft: Brood War',
      'route': FirstScreen(),
    },
    {
      'icon': 'assets/icons/starcraft-ii.svg',
      'title': 'Starcraft II',
      'route': SecondScreen(),
    },
    {},
    {
      'icon': 'assets/icons/image.svg',
      'title': 'Gallery',
      'route': GalleryScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: MainLogo(size: MediaQuery.of(context).size),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _drawerItems.length,
            itemBuilder: (context, index) {
              if (_drawerItems[index]['icon'] == null) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(thickness: 0.3),
                );
              }
              return ListTile(
                horizontalTitleGap: 0.0,
                selected: _currentIndex == index ? true : false,
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                  Provider.of<ScreenProvider>(context, listen: false)
                      .changeScreen(_drawerItems[index]['title'],
                          _drawerItems[index]['route']);
                },
                leading: SvgPicture.asset(
                  _drawerItems[index]['icon'],
                  width: 24.0,
                  height: 24.0,
                  semanticsLabel: 'Starcraft II',
                  color: isDarkMode
                      ? _currentIndex == index
                          ? Colors.white
                          : Colors.white60
                      : _currentIndex == index
                          ? Colors.black
                          : Colors.black54,
                ),
                title: Text(
                  _drawerItems[index]['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: _currentIndex == index
                    ? Icon(
                        Icons.arrow_right_rounded,
                        color: isDarkMode ? Colors.white60 : Colors.black54,
                      )
                    : null,
              );
            },
          ),
          Expanded(child: SizedBox.shrink()),
          Consumer<ThemeProvider>(
            builder: (context, value, child) => SwitchListTile(
              title: Text("Dark Mode"),
              onChanged: (val) {
                value.toggleTheme();
              },
              value: value.darkTheme,
            ),
          ),
        ],
      ),
    );
  }
}
