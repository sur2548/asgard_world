import 'package:asgard_world/features/home/presentations/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationFilterModal extends HookConsumerWidget {
  const LocationFilterModal({super.key});

  static Future<dynamic> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const LocationFilterModal();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.filter_list),
            title: const Text('All'),
            onTap: () {
              ref.read(filterProvider.notifier).state = 'All';

              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bike),
            title: const Text('Cycle'),
            onTap: () {
              ref.read(filterProvider.notifier).state = 'Cycle';
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Shopping'),
            onTap: () {
              ref.read(filterProvider.notifier).state = 'Shopping';
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Restaurant'),
            onTap: () {
              ref.read(filterProvider.notifier).state = 'Restaurant';
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
