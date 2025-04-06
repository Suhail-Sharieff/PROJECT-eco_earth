import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/controllers/_06_reusables_controller/_01_resuables_controller.dart';
import 'package:eco_earth/landing_page.dart';
import 'package:eco_earth/pages/_02_Home_page/_01_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/_05_item_condition/item_condition.dart';

class AddReusablesPage extends StatefulWidget {
  static const route_name = reusables_adding_page_route;

  @override
  _AddReusablesPageState createState() => _AddReusablesPageState();
}

class _AddReusablesPageState extends State<AddReusablesPage> {
  final _formKey = GlobalKey<FormState>();
  final owner = FirebaseAuth.instance.currentUser!.displayName;
  final controller = Get.put(ReusableController());

  final TextEditingController _photoUrlController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _pickup_locationController=TextEditingController();

  String _purchasedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  bool _isWorking = true;
  bool _needsRepairs = false;

  @override
  void dispose() {
    _photoUrlController.dispose();
    _costController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _purchasedDate = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final itemCondition = ItemCondition(
        purchased_date: _purchasedDate,
        is_working: _isWorking,
        needs_repairs: _needsRepairs,
      );

      // print('Photo URL: ${_photoUrlController.text}');
      // print('Cost: ${_costController.text}');
      // print('Title: ${_titleController.text}');
      // print('Purchased Date: $_purchasedDate');
      // print('Is Working: $_isWorking');
      // print('Needs Repairs: $_needsRepairs');

      await controller.addReusable(
        _photoUrlController.text,
        int.tryParse(_costController.text)!,
        _titleController.text,
        itemCondition.toJson(), // Convert to JSON before passing
          _pickup_locationController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
      Get.toNamed(Landing_page.route_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sell Reusable')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Owner Field
              TextFormField(
                enabled: false,
                initialValue: owner,
                decoration: const InputDecoration(
                  labelText: 'Owner',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Photo URL Field
              TextFormField(
                controller: _photoUrlController,
                decoration: const InputDecoration(
                  labelText: 'Photo URL',
                  border: OutlineInputBorder(),
                  hintText: 'Please provide product photo URL',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter photo URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Cost Field
              TextFormField(
                controller: _costController,
                decoration: const InputDecoration(
                  labelText: 'Selling Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter cost';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Purchased Date Picker
              ListTile(
                title: Text("Purchased Date: $_purchasedDate"),
                trailing: const Icon(Icons.calendar_today, color: Colors.blue),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 16),
              // Is Working Checkbox
              CheckboxListTile(
                title: const Text("Is the item working?"),
                value: _isWorking,
                onChanged: (bool? value) {
                  setState(() {
                    _isWorking = value!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Needs Repairs Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.build),
                  const Text("Needs Repairs?", style: TextStyle(fontSize: 16)),
                  DropdownButton<bool>(
                    value: _needsRepairs,
                    items: const [
                      DropdownMenuItem(
                        value: false,
                        child: Text("No"),
                      ),
                      DropdownMenuItem(
                        value: true,
                        child: Text("Yes"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _needsRepairs = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _pickup_locationController,
                decoration: const InputDecoration(
                  labelText: 'Pickup Location',
                  hintText: 'Enter your address',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid location!';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24,),
              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
