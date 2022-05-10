import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/models/map_info_model.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';

class RecentArticles extends StatefulWidget {
  RecentArticles({Key? key}) : super(key: key);

  @override
  State<RecentArticles> createState() => _RecentArticlesState();
}

class _RecentArticlesState extends State<RecentArticles> {
  String _selectedValue = 'Starcraft II';

  List _items = [];

  _filteringList() {
    _items.clear();
    for (var element in mapList) {
      if (element.game == _selectedValue) {
        _items.add(element);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _filteringList();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Articles',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .apply(fontWeightDelta: 1),
            ),
            DropdownButton<String>(
              value: _selectedValue,
              isDense: true,
              icon: Icon(Icons.arrow_drop_down),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              underline: SizedBox.shrink(),
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value!;
                });
                _filteringList();
              },
              items: <String>['Starcraft: Brood War', 'Starcraft II']
                  .map<DropdownMenuItem<String>>((value) =>
                      DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(value),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Responsive(
          mobile: RecentListView(
              items: _items,
              width: _size.width < 600 ? _size.width / 2.5 : _size.width / 4,
              selectedValue: _selectedValue),
          tablet: RecentListView(
              items: _items,
              width: _size.width / 6,
              selectedValue: _selectedValue),
          desktop: RecentListView(
              items: _items,
              width: _size.width < 1400 ? _size.width / 6 : _size.width / 10,
              selectedValue: _selectedValue),
        ),
      ],
    );
  }
}

class RecentListView extends StatelessWidget {
  final List items;
  final double height;
  final double width;
  final String selectedValue;
  const RecentListView({
    Key? key,
    required this.items,
    this.width = 140.0,
    this.height = 300.0,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) =>
            RecentCard(info: items[index], width: width, height: height),
        separatorBuilder: (context, index) => SizedBox(width: 8.0),
      ),
    );
  }
}

class RecentCard extends StatelessWidget {
  final MapInfoModel info;
  final double width;
  final double height;
  const RecentCard({
    Key? key,
    required this.info,
    this.width = 140.0,
    this.height = 300.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              info.src!,
              width: width,
              height: height,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          bottom: 12.0,
          right: 12.0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Text(
              info.title!,
              maxLines: 2,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
