import '../../../core/api_client.dart';

class SpaceXApi {
  final ApiClient client;

  SpaceXApi(this.client);

  Future<List<dynamic>> fetchRockets() => client.getList('/rockets');
  Future<List<dynamic>> fetchLaunches() => client.getList('/launches');
}
