import 'package:flutter/material.dart';
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';

class NotificationsPage extends StatefulWidget {
  static const route_name = notification_route;
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Example list of notifications.
  // You can replace this with data fetched from an API or local database.
  final List<Map<String, String>> notifications = [
    {
      'type': 'Reward',
      'message': 'Completed a daily challenge for March  Challenge 2025',
      'date': 'March 22, 2025 8:30 PM',
      'action': '+10',
    },
    {
      'type': 'Marathon',
      'message': 'Participated in Go-Green Marathon, Whitefield',
      'date': 'March 22, 2025 10:19 AM',
      'action': '+100',
    },
    {
      'type': 'Reward',
      'message': 'Completed a daily challenge for Jan Challenge 2025',
      'date': 'March 16, 2025 10:41 PM',
      'action': '+10',
    },
    {
      'type': 'Reward',
      'message': 'Completed a daily challenge for Feb  Challenge 2025',
      'date': 'March 15, 2025 10:45 PM',
      'action': '+10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Notifications', true),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              // Leading icon - customize as needed
              leading: CircleAvatar(
                backgroundColor: Colors.yellow.shade700,
                child: Icon(
                  item['type'] == 'Marathon'
                      ? Icons.emoji_events
                      : Icons.monetization_on,
                  color: Colors.white,
                ),
              ),
              // Notification title
              title: Text(
                item['type'] ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              // Notification message + date/time
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['message'] ?? '',
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['date'] ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              // Trailing action button or points
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle action (e.g., navigate to details, show popup, etc.)
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(item['action'] ?? 'VIEW'),
              ),
            ),
          );
        },
      ),
    );
  }
}
