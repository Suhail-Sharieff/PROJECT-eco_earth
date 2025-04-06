import 'package:eco_earth/Utils/_02_button.dart';
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/controllers/_05_contract_controller/_01_contract_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../enum/_02_order_status.dart';
import '../../models/_03_contract_model/contract.dart';

class ContractDetailsPage extends StatefulWidget {
  final Contract contract;
  const ContractDetailsPage({Key? key, required this.contract})
      : super(key: key);

  @override
  State<ContractDetailsPage> createState() => _ContractDetailsPageState();
}

class _ContractDetailsPageState extends State<ContractDetailsPage> {
  late OrderStatus _selectedOrderStatus;
  final ContractController controller = Get.put(ContractController());
  @override
  void initState() {
    super.initState();
    _selectedOrderStatus = widget.contract.order_status;
  }

  // Returns a user-friendly string for the given OrderStatus.
  String getOrderStatusString(OrderStatus status) {
    return status.toString().split('.').last;
  }

  // Formats the item_number_map into a readable string.
  String _formatItemMap(Map<String, dynamic> map) {
    return map.entries
        .map((entry) => "${entry.key}: ${entry.value}")
        .join(", ");
  }

  Future<void> _updateOrderStatus() async {
    await controller.update_order_status_to(
        widget.contract, _selectedOrderStatus);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Order status updated to ${getOrderStatusString(_selectedOrderStatus)}"),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildDetailTile(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contract Details"),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailTile(
                  icon: Icons.confirmation_number,
                  title: "Contract ID",
                  subtitle: "${widget.contract.id}",
                ),
                _buildDetailTile(
                  icon: Icons.date_range,
                  title: "Created At",
                  subtitle: "${widget.contract.created_at}",
                ),
                _buildDetailTile(
                  icon: Icons.person_outline,
                  title: "From ID",
                  subtitle: widget.contract.from_id,
                ),
                _buildDetailTile(
                  icon: Icons.person,
                  title: "To ID",
                  subtitle: widget.contract.to_id,
                ),
                _buildDetailTile(
                  icon: Icons.account_circle,
                  title: "Customer Name",
                  subtitle: widget.contract.customer_name,
                ),
                _buildDetailTile(
                  icon: Icons.info_outline,
                  title: "Contract Status",
                  subtitle:
                      widget.contract.order_status.toString().split('.').last,
                ),
                _buildDetailTile(
                  icon: Icons.list_alt,
                  title: "Items",
                  subtitle: _formatItemMap(widget.contract.item_number_map),
                ),
                const SizedBox(height: 24),
                const Divider(thickness: 1.5),
                const SizedBox(height: 12),
                const Text("Order Status",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Display the current status as a chip.
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<OrderStatus>(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.teal.shade200, width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        value: _selectedOrderStatus,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.teal),
                        onChanged: (OrderStatus? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedOrderStatus = newValue;
                            });
                          }
                        },
                        items: OrderStatus.values
                            .map<DropdownMenuItem<OrderStatus>>(
                                (OrderStatus value) {
                          return DropdownMenuItem<OrderStatus>(
                            value: value,
                            child: Text(getOrderStatusString(value)),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Center(
                  child: Tooltip(
                    message: (widget.contract.order_status == OrderStatus.Paid||widget.contract.order_status == OrderStatus.Cancelled)
                        ? 'Already Paid'
                        : 'Click to update status',
                    child: ElevatedButton(
                      onPressed: (widget.contract.order_status == OrderStatus.Paid || widget.contract.order_status == OrderStatus.Cancelled)
                          ? null
                          : () async {
                        await _updateOrderStatus();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          home_route,
                              (_) => false,
                        );
                      },
                      child: const Text('Update Status'),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
