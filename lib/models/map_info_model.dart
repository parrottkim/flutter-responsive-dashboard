import 'package:flutter/material.dart';

class MapInfoModel {
  final String? src;
  final String? game;
  final String? title;
  final int? playerNum;
  final String? size;

  MapInfoModel({
    this.src,
    this.game,
    this.title,
    this.playerNum,
    this.size,
  });
}

List mapList = [
  MapInfoModel(
    src: 'assets/images/map/lightbreeze01.jpg',
    title: 'Light Breeze',
    game: 'Starcraft II',
    playerNum: 4,
    size: '160 × 160',
  ),
  MapInfoModel(
    src: 'assets/images/map/oldhomeworld01.jpg',
    title: 'Old Homeworld',
    game: 'Starcraft II',
    playerNum: 2,
    size: '126 × 132',
  ),
  MapInfoModel(
    src: 'assets/images/map/newdalaran01.jpg',
    title: 'New Dalaran',
    game: 'Starcraft II',
    playerNum: 4,
    size: '164 × 164',
  ),
  MapInfoModel(
    src: 'assets/images/map/rakshir01.jpg',
    title: 'Rak`Shir',
    game: 'Starcraft II',
    playerNum: 2,
    size: '140 × 140',
  ),
  MapInfoModel(
    src: 'assets/images/map/skyscraper01.jpg',
    title: 'Skyscraper',
    game: 'Starcraft II',
    playerNum: 2,
    size: '156 × 100',
  ),
  MapInfoModel(
    src: 'assets/images/map/twilightend2-01.jpg',
    title: 'Twilight End',
    game: 'Starcraft II',
    playerNum: 4,
    size: '164 × 164',
  ),
  MapInfoModel(
    src: 'assets/images/map/thevalleyofcity01.jpg',
    title: 'The Valley of City',
    game: 'Starcraft II',
    playerNum: 2,
    size: '116 × 156',
  ),
  MapInfoModel(
    src: 'assets/images/map/maldives01.jpg',
    title: 'Maldives',
    game: 'Starcraft II',
    playerNum: 4,
    size: '164 × 164',
  ),
  MapInfoModel(
    src: 'assets/images/map/cheorwonmilitarybase01.jpg',
    title: 'Cheorwon Military Base',
    game: 'Starcraft II',
    playerNum: 4,
    size: '148 × 148',
  ),
  MapInfoModel(
    src: 'assets/images/map/newpoitiers01.jpg',
    title: 'New Poitiers',
    game: 'Starcraft: Brood War',
    playerNum: 2,
    size: '112 × 128',
  ),
  MapInfoModel(
    src: 'assets/images/map/odyssey01.jpg',
    title: 'Odyssey',
    game: 'Starcraft: Brood War',
    playerNum: 4,
    size: '128 × 128',
  ),
  MapInfoModel(
    src: 'assets/images/map/suez01.jpg',
    title: 'Suez',
    game: 'Starcraft: Brood War',
    playerNum: 2,
    size: '96 × 128',
  ),
  MapInfoModel(
    src: 'assets/images/map/twilightend1-01.jpg',
    title: 'Twilight End',
    game: 'Starcraft: Brood War',
    playerNum: 3,
    size: '128 × 128',
  ),
].reversed.toList();
