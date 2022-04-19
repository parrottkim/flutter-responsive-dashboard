import 'package:flutter/material.dart';

class OverviewModel {
  final String? src, title;
  final int? number;
  final Color? color;

  OverviewModel({
    this.src,
    this.title,
    this.number,
    this.color,
  });
}

List overview = [
  OverviewModel(
    src: 'assets/icons/file.svg',
    title: 'Total Articles',
    number: 20,
    color: Colors.green,
  ),
  OverviewModel(
    src: 'assets/icons/image.svg',
    title: 'Total Images',
    number: 120,
    color: Colors.green,
  ),
  OverviewModel(
    src: 'assets/icons/starcraft-remastered.svg',
    title: 'Starcraft: Brood War',
    number: 12,
    color: Colors.red[400],
  ),
  OverviewModel(
    src: 'assets/icons/starcraft-ii.svg',
    title: 'Starcraft II',
    number: 18,
    color: Colors.blue[400],
  ),
];
