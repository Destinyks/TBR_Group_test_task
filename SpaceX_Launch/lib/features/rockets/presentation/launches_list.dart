import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/launches_provider.dart';
import 'widgets/launch_tile.dart';

class LaunchesList extends ConsumerWidget {
  final String rocketId;
  const LaunchesList({super.key, required this.rocketId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchesAsync = ref.watch(launchesForRocketProvider(rocketId));

    return launchesAsync.when(
      data: (launches) {
        if (launches.isEmpty) {
          return const Center(
            child: Text("There are no launches for this rocket"),
          );
        }

        return ListView(
          children: [...launches.map((launch) => LaunchTile(launch: launch))],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
