import 'package:flutter/material.dart';

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
          Text(
            'PARROTT KIM',
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
