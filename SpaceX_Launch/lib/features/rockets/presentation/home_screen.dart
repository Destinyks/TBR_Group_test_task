import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex_launches/features/rockets/presentation/rocket_slider.dart';
import 'package:spacex_launches/features/rockets/providers/rockets_provider.dart';
import 'package:spacex_launches/features/rockets/providers/spacex_provider.dart'
    hide rocketsProvider;
import '../../../core/theme/app_colors.dart';
import 'widgets/launch_tile.dart';
import 'widgets/page_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final rocketsAsync = ref.watch(rocketsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("SpaceX Launches"), centerTitle: true),
      body: rocketsAsync.when(
        data: (rockets) {
          if (rockets.isEmpty) {
            return const Center(child: Text("No data available"));
          }

          final selectedRocket = rockets[selectedIndex];

          final images = rockets.map((r) {
            if (r.images.isNotEmpty) {
              return r.images.firstWhere(
                (url) => url.isNotEmpty,
                orElse: () => "",
              );
            }
            return "";
          }).toList();

          final launchesAsync = ref.watch(
            launchesProvider(selectedRocket.rocketId),
          );

          return Column(
            children: [
              RocketSlider(
                images: images,
                onPageChanged: (index) {
                  setState(() => selectedIndex = index);
                },
              ),
              const SizedBox(height: 12),
              PageIndicator(count: rockets.length, currentIndex: selectedIndex),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Missions',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: launchesAsync.when(
                  data: (launches) {
                    if (launches.isEmpty) {
                      return const Center(
                        child: Text(
                          "There are no launches for this rocket",
                          style: TextStyle(color: AppColors.grey),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: launches.length,
                      itemBuilder: (context, index) =>
                          LaunchTile(launch: launches[index]),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.accentGreen,
                    ),
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      "Error: $e",
                      style: const TextStyle(color: AppColors.grey),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.accentGreen),
        ),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
