import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({this.lat, this.lon, super.key});
  final double? lat;
  final double? lon;

  @override
  Widget build(BuildContext context) {
    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('track_order'),
        position: LatLng(lat!, lon!),
      ),
    };

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(lat!, lon!),
        zoom: 12,
      ),
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      markers: markers,
    );
  }
}
