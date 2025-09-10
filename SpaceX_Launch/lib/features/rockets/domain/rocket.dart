class Rocket {
  final String rocketId;
  final String name;
  final List<String> images;

  Rocket({required this.rocketId, required this.name, required this.images});

  factory Rocket.fromJson(Map<String, dynamic> json) {
    final imgs = <String>[];
    if (json.containsKey('flickr_images')) {
      imgs.addAll(List<String>.from(json['flickr_images']));
    }
    return Rocket(
      rocketId: json['rocket_id'] ?? json['id'] ?? '',
      name: json['rocket_name'] ?? json['name'] ?? 'Unknown',
      images: imgs,
    );
  }
}
