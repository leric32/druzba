import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../models/activity.dart';
import '../widgets/gradient_app_bar_small.dart';

class MapView extends StatefulWidget {
  List<Activity> activities = [];
  MapView({super.key, required activities});

  final String title = "Blah";

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(),
      body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: SfMaps(
            layers: [
              MapTileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                initialFocalLatLng: MapLatLng(-20, 147),
                initialZoomLevel: 13,
                zoomPanBehavior: _zoomPanBehavior,
              )
            ],
          )),
    );
  }
}
