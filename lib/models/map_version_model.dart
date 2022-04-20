class MapVersionModel {
  final String? src;
  final String? game;
  final String? title;
  final String? date;
  final String? version;

  MapVersionModel({
    this.src,
    this.game,
    this.title,
    this.date,
    this.version,
  });
}

List versionList = [
  MapVersionModel(
    src: 'assets/images/map/lightbreeze01.jpg',
    title: 'Light Breeze',
    game: 'Starcraft II',
    date: 'October 26, 2015',
    version: 'stable',
  ),
  MapVersionModel(
    src: 'assets/images/map/rakshir01.jpg',
    title: 'Rak`Shir',
    game: 'Starcraft II',
    date: 'December 27, 2015',
    version: 'official',
  ),
  MapVersionModel(
    src: 'assets/images/map/newdalaran01.jpg',
    title: 'New Dalaran',
    game: 'Starcraft II',
    date: 'January 5, 2016',
    version: 'prerelease',
  ),
  MapVersionModel(
    src: 'assets/images/map/oldhomeworld01.jpg',
    title: 'Old Homeworld',
    game: 'Starcraft II',
    date: 'February 3, 2016',
    version: 'prerelease',
  ),
  MapVersionModel(
    src: 'assets/images/map/twilightend2-01.jpg',
    title: 'Twilight End',
    game: 'Starcraft II',
    date: 'March 31, 2016',
    version: 'prerelease',
  ),
  MapVersionModel(
    src: 'assets/images/map/skyscraper01.jpg',
    title: 'Skyscraper',
    game: 'Starcraft II',
    date: 'April 20, 2016',
    version: 'prerelease',
  ),
  MapVersionModel(
    src: 'assets/images/map/thevalleyofcity01.jpg',
    title: 'The Valley of City',
    game: 'Starcraft II',
    date: 'May 3, 2016',
    version: 'stable',
  ),
  MapVersionModel(
    src: 'assets/images/map/maldives01.jpg',
    title: 'Maldives',
    game: 'Starcraft II',
    date: 'June 15, 2016',
    version: 'stable',
  ),
  MapVersionModel(
    src: 'assets/images/map/cheorwonmilitarybase01.jpg',
    title: 'Cheorwon Military Base',
    game: 'Starcraft II',
    date: 'June 15, 2016',
    version: 'stable',
  ),
  MapVersionModel(
    src: 'assets/images/map/odyssey01.jpg',
    title: 'Odyssey',
    game: 'Starcraft: Brood War',
    date: 'April 7, 2017',
    version: 'stable',
  ),
  MapVersionModel(
    src: 'assets/images/map/suez01.jpg',
    title: 'Suez',
    game: 'Starcraft: Brood War',
    date: 'May 1, 2017',
    version: 'prerelease',
  ),
  MapVersionModel(
    src: 'assets/images/map/twilightend1-01.jpg',
    title: 'Twilight End',
    game: 'Starcraft: Brood War',
    date: 'May 3, 2017',
    version: 'stable',
  ),
  MapVersionModel(
    src: 'assets/images/map/newpoitiers01.jpg',
    title: 'New Poitiers',
    game: 'Starcraft: Brood War',
    date: 'July 24, 2019',
    version: 'stable',
  ),
].reversed.toList();
