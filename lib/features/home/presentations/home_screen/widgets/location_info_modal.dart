import 'package:asgard_world/features/home/domain/location.dart';
import 'package:flutter/material.dart';

class LocationInfoModal extends StatelessWidget {
  const LocationInfoModal({
    super.key,
    required this.location,
  });

  final Location location;

  static Future<dynamic> show(BuildContext context, {required Location location}) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return LocationInfoModal(location: location);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(location.name),
          ),
          // Add more details here as needed (description, image, etc.)
        ],
      ),
    );
  }
}
