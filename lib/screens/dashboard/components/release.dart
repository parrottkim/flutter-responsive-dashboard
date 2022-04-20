import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/models/map_version_model.dart';
import 'package:flutter_responsive_dashboard/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReleaseStatus extends StatelessWidget {
  const ReleaseStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Release Status',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .apply(fontWeightDelta: 1),
          ),
        ),
        const ReleaseStatusList(),
      ],
    );
  }
}

class ReleaseStatusList extends StatelessWidget {
  const ReleaseStatusList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(8.0),
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
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: SizedBox(
        height: 500.0,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          controller: ScrollController(),
          itemCount: versionList.length,
          itemBuilder: (context, index) =>
              ReleaseStatusTile(version: versionList[index]),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class ReleaseStatusTile extends StatelessWidget {
  final MapVersionModel version;
  const ReleaseStatusTile({
    Key? key,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Widget versionWidget(MapVersionModel version) {
      switch (version.version) {
        case 'official':
          return Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
              width: 80.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.yellowAccent[700]!.withOpacity(0.1)
                    : Colors.yellowAccent[700],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                'Official',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode ? Colors.yellowAccent[700] : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        case 'stable':
          return Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
              width: 80.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.cyanAccent[700]!.withOpacity(0.1)
                    : Colors.cyanAccent[700],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                'Stable',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode ? Colors.cyanAccent[700] : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        case 'prerelease':
          return Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
              width: 80.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.greenAccent[700]!.withOpacity(0.1)
                    : Colors.greenAccent[700],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                'Prerelease',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode ? Colors.greenAccent[700] : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        default:
          return const SizedBox.shrink();
      }
    }

    if (!Responsive.isMobile(context)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? version.game == 'Starcraft II'
                        ? Colors.blue[400]!.withOpacity(0.1)
                        : Colors.red[400]!.withOpacity(0.1)
                    : version.game == 'Starcraft II'
                        ? Colors.blue[400]
                        : Colors.red[400],
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: SvgPicture.asset(
                version.game == 'Starcraft II'
                    ? 'assets/icons/starcraft-ii.svg'
                    : 'assets/icons/starcraft-remastered.svg',
                color: isDarkMode
                    ? version.game == 'Starcraft II'
                        ? Colors.blue[400]
                        : Colors.red[400]
                    : Colors.white,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(10.0)),
                child: Image.asset(
                  version.src!,
                  height: 30.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 4,
              child: Text(
                version.title!,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 3,
              child: Text(
                version.date!,
                textAlign: TextAlign.center,
              ),
            ),
            versionWidget(version),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? version.game == 'Starcraft II'
                            ? Colors.blue[400]!.withOpacity(0.1)
                            : Colors.red[400]!.withOpacity(0.1)
                        : version.game == 'Starcraft II'
                            ? Colors.blue[400]
                            : Colors.red[400],
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: SvgPicture.asset(
                    version.game == 'Starcraft II'
                        ? 'assets/icons/starcraft-ii.svg'
                        : 'assets/icons/starcraft-remastered.svg',
                    color: isDarkMode
                        ? version.game == 'Starcraft II'
                            ? Colors.blue[400]
                            : Colors.red[400]
                        : Colors.white,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(10.0)),
                    child: Image.asset(
                      version.src!,
                      height: 30.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      version.title!,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      version.date!,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                versionWidget(version),
              ],
            )
          ],
        ),
      );
    }
  }
}
