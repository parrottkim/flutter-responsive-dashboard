import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/map_list.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/overview.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/recent.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecentArticles(),
            SizedBox(height: 16.0),
            OverviewArticles(),
            SizedBox(height: 16.0),
            if (Responsive.isMobile(context)) MapList(),
            if (!Responsive.isMobile(context))
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MapList(),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox.shrink(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
