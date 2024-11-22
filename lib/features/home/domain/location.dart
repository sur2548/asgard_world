import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location {
  Location({
    required this.name,
    required this.position,
    required this.category,
    required this.icon,
  });

  final String name;
  final LatLng position;
  final String category;
  final String icon;
}
