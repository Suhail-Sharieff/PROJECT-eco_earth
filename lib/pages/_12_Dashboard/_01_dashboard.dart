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
      appBar: get_app_bar('My Orders', true),
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
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: li.length,
            itemBuilder: (_, idx) {
              final Reusable item = Reusable.fromJson(li[idx]);
              return _buildOrderCard(item);
            },
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

}
