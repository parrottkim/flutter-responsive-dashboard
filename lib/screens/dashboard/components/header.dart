import 'package:flutter_responsive_dashboard/provider/menu_provider.dart';
import 'package:flutter_responsive_dashboard/provider/screen_provider.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed:
                Provider.of<MenuProvider>(context, listen: false).controlMenu,
          ),
        Text(
          Provider.of<ScreenProvider>(context, listen: false).title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SizedBox()),
        ProfileCard(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        // color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 34.0,
            height: 34.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('parrottkim21@gmail.com'),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
