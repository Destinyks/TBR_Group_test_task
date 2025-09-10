import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacex_launches/features/rockets/providers/rockets_provider.dart';
import '../domain/launch.dart';

final launchesForRocketProvider = FutureProvider.family<List<Launch>, String>((
  ref,
  rocketId,
) async {
  return ref.read(rocketRepositoryProvider).getLaunchesForRocket(rocketId);
});
