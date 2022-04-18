import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_responsive_dashboard/screens/dashboard/components/overview.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        controller: ScrollController(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  OverviewWidget(),
                  if (Responsive.isMobile(context)) SizedBox(height: 16.0),
                  if (Responsive.isMobile(context))
                    Container(
                      color: Colors.red,
                      height: 1500.0,
                    ),
                ],
              ),
            ),
            if (!Responsive.isMobile(context)) SizedBox(width: 16.0),
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 1500.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
