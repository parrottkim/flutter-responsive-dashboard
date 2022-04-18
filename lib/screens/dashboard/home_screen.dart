import 'package:flutter_responsive_dashboard/provider/screen_provider.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 16.0),
            Expanded(child: Provider.of<ScreenProvider>(context).screen),
          ],
        ),
      ),
    );
  }
}
