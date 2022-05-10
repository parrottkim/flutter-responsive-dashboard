import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/location.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/release.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/overview.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/recent.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecentArticles(),
            SizedBox(height: 16.0),
            OverviewArticles(),
            SizedBox(height: 16.0),
            if (!Responsive.isMobile(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: ReleaseStatus(),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 1,
                    child: CompanyLocation(),
                  ),
                ],
              ),
            if (Responsive.isMobile(context))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReleaseStatus(),
                  SizedBox(height: 16.0),
                  CompanyLocation(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
