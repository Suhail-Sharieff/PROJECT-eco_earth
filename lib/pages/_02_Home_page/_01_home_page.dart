import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_05_end_drawer.dart';
import 'package:eco_earth/pages/_07_complaints_page/_01_complaints_page.dart';
import 'package:eco_earth/pages/_08_vendor_registeration_page/_01_vendor_registeration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../constants/_04_appbar.dart';

class HomePage extends StatefulWidget {
  static final String route_name = home_route;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of feature items with icon and label
  final List<Map<String, dynamic>> features = [
    {
      'icon': FontAwesomeIcons.recycle,
      'label': 'Recycle',
      'onTap': () {
        // TODO: Navigate or perform action for Recycle
      },
    },
    {
      'icon': FontAwesomeIcons.solidCommentDots,
      'label': 'Register Complaint',
      'onTap': () {
        // TODO: Navigate or perform action for Complaint Registration
        Get.to( const ComplaintsPage());
        print("HI");
      },
    },
    {
      'icon': FontAwesomeIcons.locationDot,
      'label': 'Recycling Centres Near Me',
      'onTap': () {
        // TODO: Navigate or perform action for Recycling Centres
      },
    },
    {
      'icon': FontAwesomeIcons.gaugeHigh,
      'label': 'My Dashboard',
      'onTap': () {
        // TODO: Navigate or perform action for Dashboard
      },
    },
    {
      'icon': FontAwesomeIcons.building,
      'label': 'Municipalities Around Me',
      'onTap': () {
        // TODO: Navigate or perform action for Municipalities
      },
    },
    {
      'icon': FontAwesomeIcons.store,
      'label': 'Register as a Vendor',
      'onTap': () {
        // TODO: Navigate or perform action for Vendor Registration
        Get.toNamed(VendorRegistrationPage.route_name);
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Home', true),
      endDrawer: get_end_drawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Features Section
            const Text(
              'Features',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: features
                  .map((feature) => _buildFeatureCard(
                icon: feature['icon'],
                label: feature['label'],
                onTap: feature['onTap'],
              ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            // What We Offer Section
            const Text(
              'What We Offer',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'We provide top-notch recycling services, community engagement programs, '
                      'and a platform to help you contribute to a cleaner environment. Explore our '
                      'various services and join us in making a difference.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  // maxLines: 3,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // About Us Section
            const Text(
              'About Us',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Eco Earth is committed to sustainability and environmental stewardship. '
                      'Our mission is to connect communities, encourage recycling, and promote responsible '
                      'waste management. Learn more about our initiatives and how you can get involved.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  // maxLines: 3,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Footer Section: All rights reserved text
            Center(
              child: Text(
                '© 2025 Eco Earth. All rights reserved.',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple),
              const SizedBox(height: 13),
              // Wrap text in a Flexible widget and use overflow properties
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
