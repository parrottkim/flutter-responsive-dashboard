import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/models/map_info_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapList extends StatelessWidget {
  const MapList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Map List',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .apply(fontWeightDelta: 1),
          ),
        ),
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          height: 500.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: MapListView(),
        ),
      ],
    );
  }
}

class MapListView extends StatelessWidget {
  const MapListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: mapList.length,
      itemBuilder: (context, index) => MapListTile(info: mapList[index]),
      separatorBuilder: (context, index) => Divider(),
    );
  }
}

class MapListTile extends StatelessWidget {
  final MapInfoModel info;
  const MapListTile({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {},
      hoverColor: Colors.black,
      child: Row(
        children: [
          if (info.game == 'Starcraft II')
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(8.0),
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.blue[400]!.withOpacity(0.1)
                    : Colors.blue[400],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: SvgPicture.asset(
                'assets/icons/starcraft-ii.svg',
                color: isDarkMode ? Colors.blue[400] : Colors.white,
              ),
            ),
          if (info.game == 'Starcraft: Brood War')
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              padding: EdgeInsets.all(8.0),
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.red[400]!.withOpacity(0.1)
                    : Colors.red[400],
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: SvgPicture.asset(
                'assets/icons/starcraft-remastered.svg',
                color: isDarkMode ? Colors.red[400] : Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
