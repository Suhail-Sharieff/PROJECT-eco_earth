import 'package:eco_earth/Utils/_03_show_toast.dart';
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/controllers/_05_contract_controller/_01_contract_controller.dart';
import 'package:flutter/material.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/models/_02_vendor_model/vendor.dart';
import 'package:get/get.dart';

class OrderContractPage extends StatefulWidget {
  const OrderContractPage({super.key, required this.vendor});
  final Vendor vendor;

  @override
  State<OrderContractPage> createState() => _OrderContractPageState();
}

class _OrderContractPageState extends State<OrderContractPage> {
  late final Vendor vendor;
  late final Map<String, dynamic> typeCostMap;
  final Map<String, TextEditingController> controllers = {};

  final ContractController contractController = Get.put(ContractController());

  @override
  void initState() {
    super.initState();
    vendor = widget.vendor;
    typeCostMap = vendor.types_cost_map;

    // Initialize controllers with a default value of '0'
    for (String key in typeCostMap.keys) {
      controllers[key] = TextEditingController(text: '0');
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void handleSubmit() {
    Map<String, int> results = {};
    int totalCost = 0;

    // Calculate cost for each type and overall total using the original keys.
    controllers.forEach((originalKey, controller) {
      int weight = int.tryParse(controller.text) ?? 0;
      int costPerUnit = typeCostMap[originalKey] as int;
      int calculatedValue = weight * costPerUnit;
      results[originalKey] = calculatedValue;
      totalCost += calculatedValue;
    });

    // Show a report in a popup dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Report'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                // Display report for each category using the original keys.
                for (String originalKey in typeCostMap.keys)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '$originalKey: ${controllers[originalKey]!.text} X ${typeCostMap[originalKey]} = ${results[originalKey]}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                const SizedBox(height: 10),
                Text(
                  'Total returns: ₹ $totalCost',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                // Place Order action (add your logic here)
                Navigator.of(context).pop();
                await contractController.place_contract_to(vendor, results);
                showToast('You will be soon notified by vendor!', Colors.green);
                Get.toNamed(home_route);
              },
              child: const Text('Place Order'),
            ),
            TextButton(
              onPressed: () {
                // Cancel action simply closes the dialog
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Place your item count', false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: typeCostMap.keys.length,
                itemBuilder: (context, index) {
                  // Use the original key to fetch the controller.
                  String originalKey = typeCostMap.keys.elementAt(index);
                  // Create a display string that includes the cost per kg.
                  String displayText = "$originalKey: ${typeCostMap[originalKey]}/kg";
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayText,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: controllers[originalKey],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Enter weight',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
