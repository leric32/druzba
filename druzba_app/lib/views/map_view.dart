import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../models/activity.dart';
import '../widgets/gradient_app_bar_small.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/example_popup.dart';

class MapView extends StatefulWidget {
  List<Activity> activities = [];
  MapView({super.key, required activities});

  final String title = "Blah";

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final List<Marker> _markers;

  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    super.initState();
    _markers = [
      LatLng(44.9125, 20.4612),
      LatLng(44.8125, 20.4612),
      LatLng(44.8125, 20.4612),
    ]
        .map(
          (markerPosition) => Marker(
            point: markerPosition,
            width: 40,
            height: 40,
            builder: (_) => const Icon(
              Icons.location_on,
              size: 40,
              color: Color(0xfff79c4f),
            ),
            anchorPos: AnchorPos.align(AnchorAlign.top),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(),
      body: FlutterMap(
          options: MapOptions(
            zoom: 10.0,
            center: LatLng(44.8125, 20.4612),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            PopupMarkerLayerWidget(
              options: PopupMarkerLayerOptions(
                popupController: _popupLayerController,
                markers: _markers,
                markerRotateAlignment:
                    PopupMarkerLayerOptions.rotationAlignmentFor(
                        AnchorAlign.top),
                popupBuilder: (BuildContext context, Marker marker) =>
                    ExamplePopup(marker),
              ),
            )
          ]),
    );
  }
}
