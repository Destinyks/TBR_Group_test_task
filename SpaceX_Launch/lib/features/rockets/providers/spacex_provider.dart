import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:spacex_launches/features/rockets/domain/launch.dart';
import 'package:spacex_launches/features/rockets/domain/rocket.dart';

final rocketsProvider = FutureProvider<List<Rocket>>((ref) async {
  final res = await http.get(
    Uri.parse('https://api.spacexdata.com/v3/rockets'),
  );
  if (res.statusCode == 200) {
    final List data = json.decode(res.body);
    return data.map((e) => Rocket.fromJson(e)).toList();
  }
  throw Exception('Ошибка загрузки ракет');
});

final launchesProvider = FutureProvider.family<List<Launch>, String>((
  ref,
  rocketId,
) async {
  final res = await http.get(
    Uri.parse('https://api.spacexdata.com/v3/launches?rocket_id=$rocketId'),
  );
  if (res.statusCode == 200) {
    final List data = json.decode(res.body);
    return data.map((e) => Launch.fromJson(e)).toList();
  }
  throw Exception('Ошибка загрузки запусков');
});
