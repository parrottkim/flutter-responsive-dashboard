import 'package:flutter/material.dart';

class OverviewInfo {
  final String? svgSrc, title;
  final int? number;
  final Color? color;

  OverviewInfo({
    this.svgSrc,
    this.title,
    this.number,
    this.color,
  });
}

List files = [
  OverviewInfo(
    svgSrc: 'assets/icons/file.svg',
    title: 'Total Articles',
    number: 20,
    color: Colors.green,
  ),
  OverviewInfo(
    svgSrc: 'assets/icons/image.svg',
    title: 'Total Photos',
    number: 120,
    color: Colors.green,
  ),
  OverviewInfo(
    svgSrc: 'assets/icons/starcraft-remastered.svg',
    title: 'Starcraft: Brood War',
    number: 12,
    color: Colors.red,
  ),
  OverviewInfo(
    svgSrc: 'assets/icons/starcraft-ii.svg',
    title: 'Starcraft II',
    number: 18,
    color: Colors.blue,
  ),
];
