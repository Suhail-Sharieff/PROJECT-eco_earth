import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/controllers/_06_reusables_controller/_01_resuables_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddReusablesPage extends StatefulWidget {
  static const route_name = reusables_adding_page_route;
  @override
  _AddReusablesPageState createState() => _AddReusablesPageState();
}

class _AddReusablesPageState extends State<AddReusablesPage> {
  final _formKey = GlobalKey<FormState>();
  final owner=FirebaseAuth.instance.currentUser!.displayName;
  final controller=Get.put(ReusableController());


  final TextEditingController _photoUrlController =
  TextEditingController();
  final TextEditingController _costController =
  TextEditingController();
  final TextEditingController _titleController =
  TextEditingController();
@override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _photoUrlController.dispose();
    _costController.dispose();
    _titleController.dispose();
    super.dispose();
  }



  Future<void> _submitForm() async{
    if (_formKey.currentState!.validate()) {
      // Here you could create an instance of your Reusable model.
      print('Photo URL: ${_photoUrlController.text}');
      print('Cost: ${_costController.text}');
      print('Title: ${_titleController.text}');
      await controller.addReusable(_photoUrlController.text, int.tryParse(_costController.text)!, _titleController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reusable Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Created At Field with Validator and Date Picker
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
              // Buyer Field

              const SizedBox(height: 16),
              // Photo URL Field
              TextFormField(
                controller: _photoUrlController,
                decoration: const InputDecoration(
                  labelText: 'Photo URL',
                  border: OutlineInputBorder(),
                  hintText: 'Please provide product photo url'
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
                  labelText: 'Selling price',
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
                  labelText: 'Product description',
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
              // Status Field
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
