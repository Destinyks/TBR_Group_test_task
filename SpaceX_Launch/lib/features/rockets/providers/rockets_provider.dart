import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/rocket_repository.dart';
import '../data/spacex_api.dart';
import '../../../core/api_client.dart';
import '../domain/rocket.dart';

final apiClientProvider = Provider(
  (ref) => ApiClient('https://api.spacexdata.com/v3'),
);
final spaceXApiProvider = Provider(
  (ref) => SpaceXApi(ref.read(apiClientProvider)),
);
final rocketRepositoryProvider = Provider(
  (ref) => RocketRepository(ref.read(spaceXApiProvider)),
);

final rocketsProvider = FutureProvider<List<Rocket>>((ref) async {
  return ref.read(rocketRepositoryProvider).getRockets();
});
