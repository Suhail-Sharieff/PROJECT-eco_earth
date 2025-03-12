import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// This class handles the Page to edit the Phone Section of the User Profile.
class EditPhoneFormPage extends StatefulWidget {
  static const route_name=edit_user_ph_no;
  const EditPhoneFormPage({Key? key}) : super(key: key);
  @override
  EditPhoneFormPageState createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditPhoneFormPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final instance=FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void updateUserValue(String phone) {
    String formattedPhoneNumber = "(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6, phone.length)}";
    // user.phone = formattedPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: get_app_bar('Edit Phone ', true),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 320,
                    child: Text(
                      "What's Your Phone Number?",
                      style:
                      TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Your Phone Number',
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                updateUserValue(phoneController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}