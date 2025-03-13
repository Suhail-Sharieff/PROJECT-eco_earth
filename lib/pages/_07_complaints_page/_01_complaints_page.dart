import 'package:eco_earth/Utils/_02_button.dart';
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/controllers/_03_complaint_controller/_01_complaint_controller.dart';
import 'package:eco_earth/models/_01_complaint_model/complaint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ComplaintsPage extends StatefulWidget {
  static final route_name = complaint_route;
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController photoUrlController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ComplaintController controller = Get.put(ComplaintController());
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: get_app_bar('Register Complaint', true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                    photoUrlController, 'Photo URL', TextInputType.url),
                _buildTextField(
                    locationController, 'Location', TextInputType.text),
                _buildTextField(descriptionController, 'Description',
                    TextInputType.multiline,
                    maxLines: 3),
                const SizedBox(height: 16),
                MyButton(
                    buttonTitle: 'Submit',
                    isLoading: isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Complaint Submitted Successfully')),
                        );
                      }
                      setState(() {
                        isLoading=true;
                      });
                      await controller.add_complaint(photoUrlController.text,
                          locationController.text, descriptionController.text);
                      isLoading=false;
                      Get.toNamed(home_route);
                    },
                    btnColor: Colors.blue),

                const SizedBox(height: 24),
                // Footer Section: All rights reserved text
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      'Note: The above form data on submission could be seen publicly, authorities and Municipalities ',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, TextInputType inputType,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
