import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/controllers/_06_reusables_controller/_01_resuables_controller.dart';
import 'package:eco_earth/models/_04_reusables/reusable.dart';
import 'package:eco_earth/pages/_11_reusables_page/_01_add_reusbale.dart';
import 'package:eco_earth/pages/_11_reusables_page/_03_resuable_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ReusablesPage extends StatefulWidget {
  static const route_name = reusables_page_route;
  const ReusablesPage({super.key});

  @override
  State<ReusablesPage> createState() => _ReusablesPageState();
}

class _ReusablesPageState extends State<ReusablesPage> {
  final controller = Get.put(ReusableController());

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Reusables', true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddReusablesPage.route_name);
        },
        tooltip: 'Sell item',
        backgroundColor: Colors.blueAccent,
        child: const FaIcon(FontAwesomeIcons.circleDollarToSlot, color: Colors.white),
      ),
      body: FutureBuilder(
        future: controller.get_resuables_list(),
        builder: (_, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: Lottie.asset('assets/lottie/ai.json'));
          }
          if (!snap.hasData || snap.data!.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_empty, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text(
                    'No reusables yet!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          final List<Map<String, dynamic>> res = snap.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: res.length,
            itemBuilder: (_, idx) {
              final Reusable item = Reusable.fromJson(res[idx]);
              return _buildReusableCard(item);
            },
          );
        },
      ),
    );
  }

  Widget _buildReusableCard(Reusable item) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for Image and Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail Image with Error Handling
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.photo_url.isNotEmpty ? item.photo_url : _getPlaceholderImage(),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.network(
                        _getPlaceholderImage(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Item Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "₹${item.cost}",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Status Tag & Buy Now Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status Tag
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: item.status == 0 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    item.status == 0 ? "In Stock" : "Out of Stock",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),

                // "Buy Now" Button (only if item is in stock)
                if (item.status == 0)
                  ElevatedButton(
                    onPressed: (){
                      // print(item);
                      Get.to(()=>ReusableDetails(item: item));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Function to return a placeholder image URL
  String _getPlaceholderImage() {
    return 'https://as1.ftcdn.net/v2/jpg/04/62/93/66/1000_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg';
  }

}
