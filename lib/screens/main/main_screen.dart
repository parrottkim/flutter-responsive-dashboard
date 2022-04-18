import 'package:flutter_responsive_dashboard/provider/menu_provider.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/home_screen.dart';
import 'package:flutter_responsive_dashboard/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<MenuProvider>(context, listen: false).scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              SizedBox(
                width: 260.0,
                child: SideMenu(),
              ),
            Expanded(child: HomeScreen()),
          ],
        ),
      ),
    );
  }
}
