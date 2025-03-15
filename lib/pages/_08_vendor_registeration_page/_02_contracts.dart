import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/controllers/_05_contract_controller/_01_contract_controller.dart';
import 'package:eco_earth/models/_03_contract_model/contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            // Display the contract ID as a header
            Text(
              'Customer ID: ${contract.from_id}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Display category information if available
            Text(
              'Categories: ${contract.item_number_map.toString()}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            // Display weight information if available
            Text(
              'Name: ${contract.customer_name}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            // Display cost information if available
            Text(
              'STATUS: ${contract.contract_status}',
              style: const TextStyle(fontSize: 12, color: Colors.green),
            ),
            // You can add more details here if needed
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('My contracts', true),
      body: FutureBuilder<List<Contract>>(
        future: contractController.getContracts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No contracts yet!'));
          }
          final List<Contract> contracts = snapshot.data!;
          return ListView.builder(
            itemCount: contracts.length,
            itemBuilder: (context, index) {
              return buildContractCard(contracts[index]);
            },
          );
        },
      ),
    );
  }
}
