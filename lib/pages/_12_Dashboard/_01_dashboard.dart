import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/controllers/_06_reusables_controller/_01_resuables_controller.dart';
import 'package:eco_earth/models/_04_reusables/reusable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DashBoardPage extends StatefulWidget {
  static const String route_name = dashboard_route;
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final controller = Get.put(ReusableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Dashboard', true),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: controller.get_resuables_ordered_by_user(),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Lottie.asset('assets/lottie/ai.json'));
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No order history! Buy something to earn points'),
            );
          }

          final List<Map<String, dynamic>> li = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                // Orders List
                ListView.builder(
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: li.length,
                  itemBuilder: (_, idx) {
                    final Reusable item = Reusable.fromJson(li[idx]);
                    return _buildOrderCard(item);
                  },
                ),

                const SizedBox(height: 20),

                // Stats Section
                _buildStatsSection(),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderCard(Reusable item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.photo_url,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
              ),
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              "Cost: ₹${item.cost}",
              style: const TextStyle(color: Colors.green, fontSize: 14),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: item.status == 1 ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item.status == 1 ? "Delivered" : "Pending",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: item.status == 1 ? Colors.green : Colors.orange,
                ),
              ),
            ),
          ),

          ExpansionTile(
            title: const Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.blue),
                title: Text("Purchased Date: ${item.condition?.purchased_date ?? 'N/A'}"),
              ),
              ListTile(
                leading: Icon(item.condition?.is_working == true ? Icons.check_circle : Icons.error,
                    color: item.condition?.is_working == true ? Colors.green : Colors.red),
                title: Text(item.condition?.is_working == true ? "Working Condition" : "Not Working"),
              ),
              ListTile(
                leading: Icon(item.condition?.needs_repairs == true ? Icons.build : Icons.done,
                    color: item.condition?.needs_repairs == true ? Colors.orange : Colors.green),
                title: Text(item.condition?.needs_repairs == true ? "Needs Repairs" : "No Repairs Needed"),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildStatCard("Total Recycled", "45", Icons.recycling, Colors.green),
          const SizedBox(height: 10),
          _buildStatCard("Carbon Saved", "125 kg", Icons.eco, Colors.blue),
          const SizedBox(height: 10),
          _buildStatCard("Materials Recovered", "18 kg", Icons.battery_full, Colors.purple),
          const SizedBox(height: 10),
          _buildStatCard("Impact Score", "320", Icons.emoji_events, Colors.orange),
          const SizedBox(height: 10),
          _buildAchievementBadges(["Early Adopter", "Eco Warrior", "Tech Recycler"]),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementBadges(List<String> badges) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.orange.shade200, Colors.amber.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Icon and Title
              const Row(
                children: [
                  Icon(Icons.emoji_events, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                  Text(
                    "Achievements",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Achievement Badges List
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: badges.map((badge) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
