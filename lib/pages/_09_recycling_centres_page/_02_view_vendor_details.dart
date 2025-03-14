import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:flutter/material.dart';
import '../../models/_02_vendor_model/vendor.dart';

class ViewVendorDetails extends StatefulWidget {
  final Vendor v;
  const ViewVendorDetails({Key? key, required this.v}) : super(key: key);

  @override
  State<ViewVendorDetails> createState() => _ViewVendorDetailsState();
}

class _ViewVendorDetailsState extends State<ViewVendorDetails> {
  late final Vendor vendor;
  bool isStarred = false; // Track if vendor is starred

  @override
  void initState() {
    vendor = widget.v;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(vendor.vendor_shop_name),
          backgroundColor: Colors.green.shade700,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vendor Basic Info Section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green.shade100,
                          child: Icon(Icons.store, size: 30, color: Colors.green.shade700),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vendor.vendor_name,
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      vendor.vendor_location,
                                      style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.phone, size: 16, color: Colors.grey.shade600),
                                  const SizedBox(width: 4),
                                  Text(
                                    vendor.vendor_phone_number,
                                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 30, thickness: 1),
                    // Rating Section
                    Row(
                      children: [
                        Text(
                          'Rating:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < vendor.rating ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Material Types as Tags Section
                    Text(
                      'Categories:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: vendor.types_cost_map.keys.map((key) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "#$key",
                                style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Action Buttons Section
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Star Vendor Button
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isStarred = !isStarred;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isStarred ? Colors.amber : Colors.grey.shade400,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(
                            isStarred ? Icons.star : Icons.star_border,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Star",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        // Request Service Button
                        const SizedBox(height: 40,),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Request Service Action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.request_page, color: Colors.white),
                          label: const Text(
                            "Request Service",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
