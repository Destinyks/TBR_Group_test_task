import '../domain/rocket.dart';
import '../domain/launch.dart';
import 'spacex_api.dart';

class RocketRepository {
  final SpaceXApi api;
  RocketRepository(this.api);

  Future<List<Rocket>> getRockets() async {
    final data = await api.fetchRockets();
    return data.map((e) => Rocket.fromJson(e)).toList();
  }

  Future<List<Launch>> getLaunchesForRocket(String rocketId) async {
    final data = await api.fetchLaunches();
    return data
        .where((e) => e['rocket']['rocket_id'] == rocketId)
        .map((e) => Launch.fromJson(e))
        .toList();
  }
}
