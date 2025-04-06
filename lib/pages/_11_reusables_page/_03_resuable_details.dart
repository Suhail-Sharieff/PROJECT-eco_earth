import 'package:eco_earth/controllers/_06_reusables_controller/_01_resuables_controller.dart';
import 'package:eco_earth/enum/_02_order_status.dart';
import 'package:eco_earth/landing_page.dart';
import 'package:eco_earth/models/_04_reusables/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/_05_item_condition/item_condition.dart';

class ReusableDetails extends StatefulWidget {
  final Reusable item;
  const ReusableDetails({super.key, required this.item});

  @override
  State<ReusableDetails> createState() => _ReusableDetailsState();
}

class _ReusableDetailsState extends State<ReusableDetails> {
  late final Reusable item;
  late final ItemCondition? condition; // Item condition data
  final controller = Get.put(ReusableController());

  @override
  void initState() {
    item = widget.item;
    condition = item.condition; // Assign the condition if available
    super.initState();
  }

  Future<void> _buyNow() async {
    await controller.buy_reusable(item, FirebaseAuth.instance.currentUser!.uid);
    Get.showSnackbar(const GetSnackBar(
      messageText: Text('Order placed , check your dashboard to track!'),
      icon: Icon(Icons.done_outline_sharp),
      backgroundColor: Colors.greenAccent,
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 12),
    ));
    Get.toNamed(Landing_page.route_name);
  }

  Future<void> _showConfirmationDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.shopping_cart_checkout, color: Colors.green),
              SizedBox(width: 8),
              Text("Confirm Purchase",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ],
          ),
          content: const Text("Are you sure you want to buy this item?"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
              child: const Text("No", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
            ),
            ElevatedButton.icon(
              onPressed: () async {
                Navigator.of(context).pop();
                await _buyNow();
              },
              icon: const Icon(Icons.check),
              label: const Text("Yes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Details'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Display with Rounded Corners
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item.photo_url.isNotEmpty
                    ? item.photo_url
                    : _getPlaceholderImage(),
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  _getPlaceholderImage(),
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              item.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Details Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(Icons.person, "Owner ID", item.owner),
                    const Divider(),
                    _buildDetailRow(
                        Icons.account_circle, "Description", item.title),
                    const Divider(),
                    _buildDetailRow(
                        Icons.attach_money, "Cost", "₹${item.cost}"),
                    const Divider(),
                    Chip(backgroundColor:Colors.greenAccent,label: Text(item.order_status!=OrderStatus.Paid?"In Stock ✅":"Not Available !")),
                    const Divider(),

                    // Purchased Date (New Field)
                    _buildDetailRow(Icons.calendar_today, "Purchased Date",
                        condition?.purchased_date ?? "Unknown"),

                    const Divider(),

                    // Is Working (New Field)
                    _buildDetailRow(
                      Icons.check_circle,
                      "Working Condition",
                      (condition?.is_working ?? true) ? "Yes ✅" : "No ❌",
                    ),

                    const Divider(),

                    // Needs Repairs (New Field)
                    _buildDetailRow(
                      Icons.build,
                      "Needs Repairs",
                      (condition?.needs_repairs ?? false) ? "Yes 🔧" : "No ✅",
                    ),
                    const Divider(),
                    ListTile(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            'Pickup Location',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          item.pickup_location,
                          style: const TextStyle(fontSize: 14),
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Buy Now Button (Only if item is in stock)
            if (item.order_status == OrderStatus.Approved)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showConfirmationDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper function for details styling with an icon
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          "$label: ",
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  // Status Tag Widget
  Widget _buildStatusTag(int status) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: status == 0 ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status == 0 ? "In Stock ✅" : "Out of Stock ❌",
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  // Placeholder Image URL
  String _getPlaceholderImage() {
    return 'https://as1.ftcdn.net/v2/jpg/04/62/93/66/1000_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg';
  }
}
