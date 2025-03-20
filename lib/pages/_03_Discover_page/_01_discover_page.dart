import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/constants/_05_end_drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverPage extends StatefulWidget {
  static const String route_name = discover_route;
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  // Sample list with logo URLs added.
  final List<Map<String, String>> websites = [
    {
      "name": "CPCB Board",
      "description":
      "The Central Pollution Control Board (CPCB), a statutory organisation, was constituted in 1974 under various pollution acts.",
      "url": "https://eprewastecpcb.in/#/",
      "logo": "https://eprewastecpcb.in/assets/cpcb_logo.png"
    },
    {
      "name": "Zolo Pick",
      "description":
      "Zolopik / Trivendent Technologies is a Government Authorised E-Waste Recycler helping households and industries sell their e-waste at the best price.",
      "url": "https://zolopik.com/",
      "logo": "https://zolopik.com/wp-content/uploads/2024/04/zolopik-logo.svg"
    },
    {
      "name": "EWRI",
      "description":
      "E-Waste Recyclers India (EWRI) are experts in electronic waste management including collection, dismantling, recycling, and data sanitization.",
      "url": "https://www.ewri.in/",
      "logo": "https://www.ewri.in/wp-content/uploads/2021/10/EWRI-Logo-for-site-500x300px.png"
    },
    {
      "name": "E-mart",
      "description":
      "Global e-waste recycling certification program ensuring responsible disposal and recycling of electronic waste.",
      "url": "https://ewastemart.co.in/",
      "logo": "https://ewastemart.co.in/assets/images/header/ewaste_logo.png"
    },
    {
      "name": "Saahas",
      "description":
      "Saahas Zero Waste focuses on resource recovery, safe livelihoods, zero landfill waste, and regulatory compliance through professional waste management.",
      "url": "https://saahaszerowaste.com/",
      "logo": "https://saahas.org/wp-content/uploads/2024/04/Saahas-logo.svg"
    },
  ];

  // Function to launch URL externally.
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar("Discover News!", true),
      endDrawer: get_end_drawer(context),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: websites.length,
        itemBuilder: (context, index) {
          final website = websites[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(website["logo"]!),
                        radius: 25,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          website["name"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    website["description"]!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => _launchURL(website["url"]!),
                      icon: const Icon(Icons.link),
                      label: const Text("Visit Website"),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
