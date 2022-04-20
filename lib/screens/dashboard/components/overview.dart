import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/models/overview_model.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_svg/svg.dart';

class OverviewArticles extends StatelessWidget {
  const OverviewArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Overview',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .apply(fontWeightDelta: 1),
          ),
        ),
        Responsive(
          mobile:
              OverviewCardGridView(crossAxisCount: _size.width < 700 ? 1 : 2),
          tablet:
              OverviewCardGridView(crossAxisCount: _size.width < 1100 ? 2 : 4),
          desktop: OverviewCardGridView(),
        ),
      ],
    );
  }
}

class OverviewCardGridView extends StatelessWidget {
  final int crossAxisCount;
  const OverviewCardGridView({
    Key? key,
    this.crossAxisCount = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: ScrollController(),
      padding: EdgeInsets.all(8.0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: overview.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 70,
      ),
      itemBuilder: (context, index) => OverviewCard(info: overview[index]),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final OverviewModel info;
  const OverviewCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.blueGrey[700] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: isDarkMode ? info.color!.withOpacity(0.1) : info.color,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: SvgPicture.asset(
              info.src!,
              color: isDarkMode ? info.color : Colors.white,
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.title!,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              Text(
                "${info.number} Files",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  fontSize: 16.0,
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
