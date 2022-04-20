import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class CompanyLocation extends StatelessWidget {
  const CompanyLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Company Location',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .apply(fontWeightDelta: 1),
          ),
        ),
        MapWidget(),
      ],
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 500.0,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: FlutterMap(
          options: MapOptions(
            enableScrollWheel: false,
            center: LatLng(33.65820, -117.76755),
            zoom: 18.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              attributionBuilder: (_) {
                return Text("© OpenStreetMap contributors");
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 230.0,
                  height: 140.0,
                  point: LatLng(33.65840, -117.76755),
                  builder: (context) => Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipOval(
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                          height: 6.0,
                          width: 30.0,
                          child: Center(
                            child: Text(
                              'Oval Shape',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Image.asset(
                          'assets/icons/marker.png',
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          width: 230.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.blueGrey[700]
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Blizzard Entertainment',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .apply(fontWeightDelta: 1),
                              ),
                              Text('16215 Alton Pkwy, Irvine, CA 92618'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
