import 'package:flutter/material.dart';
import 'package:spacex_launches/core/theme/app_colors.dart';
import 'package:spacex_launches/features/rockets/domain/launch.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchTile extends StatelessWidget {
  final Launch launch;

  const LaunchTile({super.key, required this.launch});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('MM/dd/yyyy').format(launch.dateUtc);
    final time = DateFormat('hh:mm a').format(launch.dateUtc);

    return GestureDetector(
      onTap: () async {
        if (launch.wikipedia != null) {
          final uri = Uri.parse(launch.wikipedia!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        }
      },
      child: Card(
        color: AppColors.darkGrey,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      color: AppColors.accentGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    time,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      launch.missionName,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      launch.launchSite,
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
