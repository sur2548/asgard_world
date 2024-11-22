import 'package:asgard_world/constants/index.dart';
import 'package:asgard_world/features/home/domain/location.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationsProvider = Provider<List<Location>>((ref) {
  return [
    Location(
      name: 'Cycle Shop 1',
      position: const LatLng(22.5726, 88.3639),
      category: 'Cycle',
      icon: Assets.iconCycle,
    ),
    Location(
      name: 'Mall 1',
      position: const LatLng(22.5681, 88.3594),
      category: 'Shopping',
      icon: Assets.iconShopping,
    ),
    Location(
      name: 'Restaurant 1',
      position: const LatLng(22.5705, 88.3661),
      category: 'Restaurant',
      icon: Assets.iconRestaurant,
    ),
  ];
});

final filteredLocationsProvider = Provider<List<Location>>((ref) {
  final locations = ref.watch(locationsProvider);
  final filter = ref.watch(filterProvider);

  if (filter == 'All') return locations;

  return locations.where((e) => e.category == filter).toList();
});

final filterProvider = StateProvider<String>((ref) => 'All');

final mapControllerProvider = StateProvider<GoogleMapController?>((ref) => null);

final customIconProvider = FutureProvider<Map<String, AssetMapBitmap>>((ref) async {
  const configuration = ImageConfiguration(size: Size(48, 48));

  final restaurant = await BitmapDescriptor.asset(configuration, Assets.iconRestaurant);
  final shopping = await BitmapDescriptor.asset(configuration, Assets.iconShopping);
  final cycle = await BitmapDescriptor.asset(configuration, Assets.iconCycle);

  return {
    Assets.iconRestaurant: restaurant,
    Assets.iconShopping: shopping,
    Assets.iconCycle: cycle,
  };
});
