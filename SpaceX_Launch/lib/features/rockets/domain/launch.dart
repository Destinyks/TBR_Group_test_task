class Launch {
  final DateTime dateUtc;
  final String missionName;
  final String launchSite;
  final String? wikipedia;

  Launch({
    required this.dateUtc,
    required this.missionName,
    required this.launchSite,
    this.wikipedia,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    final site = json['launch_site']?['site_name'] ?? 'Unknown site';
    return Launch(
      dateUtc:
          DateTime.tryParse(json['launch_date_utc'] ?? '') ?? DateTime.now(),
      missionName: json['mission_name'] ?? 'No name',
      launchSite: site,
      wikipedia: json['links']?['wikipedia'],
    );
  }
}
