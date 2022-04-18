import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MainLogo extends StatelessWidget {
  final Size size;
  const MainLogo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 34.0,
            height: 34.0,
            child: Image.asset(
              'assets/icons/parrot.png',
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PARROTT KIM',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
