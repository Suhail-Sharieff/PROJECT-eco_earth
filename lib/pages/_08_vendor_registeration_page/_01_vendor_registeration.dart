import 'package:eco_earth/Utils/_03_show_toast.dart';
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/controllers/_04_vendor_controller/_01_vendor_controller.dart';
import 'package:eco_earth/models/_02_vendor_model/vendor.dart';
import 'package:eco_earth/pages/_08_vendor_registeration_page/_02_contracts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';



class VendorRegistrationPage extends StatefulWidget {
  const VendorRegistrationPage({super.key});
  static const route_name=vendor_registration_route;
  @override
  State<VendorRegistrationPage> createState() => _VendorRegistrationPageState();
}

class _VendorRegistrationPageState extends State<VendorRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firebaseUidController = TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController vendorLocationController = TextEditingController();
  final TextEditingController vendorShopNameController = TextEditingController();
  final TextEditingController vendorPhoneNumberController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  final List<String> categories = [
    'Biodegradable', 'E-waste', 'Plastic', 'Paper', 'Textile', 'Glass', 'Metal'
  ];
  final Map<String, TextEditingController> typesCostMap = {};

  final vendorcontroller=Get.put(VendorController());

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      typesCostMap[category] = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: vendorcontroller.curr_user_is_vendor(),
      builder: (context,snap) {
        if(snap.connectionState==ConnectionState.waiting) {
          showToast('You r already registered!', Colors.blueAccent);
          return Center(child: Lottie.asset('assets/lottie/ai.json', height: 200,),);
        }
        if(snap.data==true) return const VendorContractsPage();
        return Scaffold(
          appBar: get_app_bar('', true),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Vendor Registration',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(vendorNameController, 'Vendor Name'),
                            _buildTextField(vendorLocationController, 'Vendor Location'),
                            _buildTextField(vendorShopNameController, 'Enterprise Name'),
                            _buildTextField(vendorPhoneNumberController, 'Phone No',isNumeric: true),
                            const SizedBox(height: 16),
                            const Text(
                              'Define Cost and then select categories',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: categories.map((category) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: typesCostMap[category]!.text.isNotEmpty,
                                      onChanged: (value) {
                                        setState(() {
                                          if (!value!) {
                                            typesCostMap[category]!.clear();
                                          }
                                        });
                                      },
                                    ),
                                    Expanded(child: Text(category)),
                                    SizedBox(
                                      width: 100,
                                      child: _buildTextField(typesCostMap[category]!, 'Cost', isNumeric: true),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () async{
                                if (_formKey.currentState!.validate()) {
                                  Map<String, int> selectedTypesCost = {};
                                  for (var entry in typesCostMap.entries) {
                                    if (entry.value.text.isNotEmpty) {
                                      selectedTypesCost[entry.key] = int.parse(entry.value.text);
                                    }
                                  }
                                  if (selectedTypesCost.isNotEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Vendor Registered Successfully')),
                                    );
                                    print(selectedTypesCost);
                                    await vendorcontroller.register_vendor(
                                      Vendor(
                                        firebaseUid: FirebaseAuth.instance.currentUser!.uid,
                                        rating: 0,
                                        types_cost_map: selectedTypesCost,
                                        vendor_location: vendorLocationController.text,
                                        vendor_name: vendorNameController.text,
                                        vendor_shop_name: vendorShopNameController.text,
                                        vendor_phone_number: vendorPhoneNumberController.text,
                                      )
                                    );
                                    Get.toNamed(home_route);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Please select at least one category and enter cost')),
                                    );
                                  }
                                }
                              },
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty || (label=='Phone No' && controller.text.length<10)) {
            if(label!='Cost') return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
