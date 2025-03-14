import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/constants/_05_end_drawer.dart';
import 'package:eco_earth/controllers/_04_vendor_controller/_01_vendor_controller.dart';
import 'package:eco_earth/models/_02_vendor_model/vendor.dart';
import 'package:eco_earth/pages/_09_recycling_centres_page/_02_view_vendor_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RecyclingCentres extends StatefulWidget {
  static const route_name=recycling_centres_routes;
  const RecyclingCentres({super.key});

  @override
  State<RecyclingCentres> createState() => _RecyclingCentresState();
}

class _RecyclingCentresState extends State<RecyclingCentres> {
  final VendorController controller=Get.put(VendorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar("Recycling Centres", true),
      endDrawer: get_end_drawer(context),
      body: FutureBuilder<PostgrestList>(
        future: controller.get_vendors(),
        builder: (_,snap){
          if(snap.connectionState==ConnectionState.waiting) return const Center(child: CircularProgressIndicator(),);
          
          List<Map<String,dynamic>>li=snap.data!;
          
          return ListView.builder(
            itemCount: li.length,
            itemBuilder: (_,idx){
              Vendor v=Vendor.fromJson(li[idx]);
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Icon(Icons.store, color: Colors.green.shade700),
                ),
                title: Text(
                  v.vendor_shop_name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      v.vendor_name,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (r) {
                        return Icon(
                          r < v.rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: v.types_cost_map.keys.map((key) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "#$key",
                              style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ),
                        )).toList(),
                      ),
                    ),


                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  // Define navigation or actions here
                  Get.to(()=>ViewVendorDetails(v: v));
                },
              );

            },
          );
          
        },
      ),
    );
  }
}
