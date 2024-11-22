import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_screen_controller.dart';
import 'widgets/location_filter_modal.dart';
import 'widgets/location_info_modal.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locations = ref.watch(filteredLocationsProvider);
    final customIcons = ref.watch(customIconProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Map'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          LocationFilterModal.show(context);
          _animationController.reset();
          _animationController.forward();
        },
        child: const Icon(Icons.filter_list),
      ),
      body: customIcons.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (Object error, StackTrace stackTrace) {
          return const Center(child: Text('Sorry, something went wrong!'));
        },
        data: (Map<String, AssetMapBitmap> data) {
          return GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              ref.read(mapControllerProvider.notifier).state = controller;
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(22.5726, 88.3639),
              zoom: 14,
            ),
            markers: {
              ...locations.map((location) {
                return Marker(
                  markerId: MarkerId(location.name),
                  position: location.position,
                  icon: data[location.icon]!,
                  onTap: () {
                    LocationInfoModal.show(
                      context,
                      location: location,
                    );
                  },
                  infoWindow: InfoWindow(title: location.name),
                );
              })
            },
          );
        },
      ),
    );
  }
}
