import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/models/overview_info.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_svg/svg.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 16.0),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            // childAspectRatio: _size.width < 650 ? 3 / 2 : 3 / 2.75,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
              // childAspectRatio: _size.width < 1400 ? 3 / 2 : 3 / 1.5,
              ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 3 / 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      controller: ScrollController(),
      padding: EdgeInsets.all(8.0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: files.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        // childAspectRatio: 3 / 1.75,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: files[index]),
    );
  }
}

class FileInfoCard extends StatelessWidget {
  final OverviewInfo info;
  const FileInfoCard({Key? key, required this.info}) : super(key: key);

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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                height: 40.0,
                width: 40.0,
                color: info.color,
                child: SvgPicture.asset(
                  info.svgSrc!,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.title!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${info.number} Files",
                style: Theme.of(context).textTheme.caption!.apply(
                    fontSizeFactor:
                        _size.width < 400 ? 1.5 : _size.width * 0.002),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
