import 'package:eco_earth/Utils/_03_show_toast.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/controllers/_05_contract_controller/_01_contract_controller.dart';
import 'package:eco_earth/models/_03_contract_model/contract.dart';
import 'package:eco_earth/pages/_11_reusables_page/_01_add_reusbale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VendorContractsPage extends StatefulWidget {
  const VendorContractsPage({super.key});

  @override
  State<VendorContractsPage> createState() => _VendorContractsPageState();
}

class _VendorContractsPageState extends State<VendorContractsPage> {
  final ContractController contractController = Get.put(ContractController());

  // Build a card for each contract
  Widget buildContractCard(Contract contract) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the customer ID as a header
            Text(
              'Customer ID: ${contract.from_id}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Display category information
            Text(
              'Categories: ${contract.item_number_map.toString()}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            // Display customer name
            Text(
              'Name: ${contract.customer_name}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            // Display order date
            Text(
              'Ordered on: ${contract.created_at}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 8),
            // Row with contract status and MarkComplete button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: get_color(contract.contract_status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    contract.contract_status,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async{
                    await contractController.mark_as_completed(contract);
                  },
                  child: const Text('Collected'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  static Color get_color(String status) {
    switch (status) {
      case 'PENDING':
        return Colors.red;
      case 'COMPLETED':
        return Colors.green;
    }
    return Colors.brown;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contracts'),
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          'Delete completed records?',
                          style: TextStyle(fontSize: 14),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              // Place Order action (add your logic here)
                              await contractController
                                  .delete_completed_contracts();
                              Navigator.of(context).pop();
                              // print('Order placed: $results');
                              showToast('Delete Success!', Colors.greenAccent);
                              setState(() {});
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () async{
                              // Cancel action simply closes the dialog
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.update))
        ],
      ),
      body: StreamBuilder<PostgrestList>(
        stream: contractController.getContracts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No contracts yet!'));
          }
          final List<Contract> contracts =
              snapshot.data!.map((e) => Contract.fromJson(e)).toList();
          return ListView.builder(
            itemCount: contracts.length,
            itemBuilder: (context, index) {
              return buildContractCard(contracts[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add item to reusable', onPressed: () {
          Get.toNamed(AddReusablesPage.route_name);
      },
      ),
    );
  }
}
