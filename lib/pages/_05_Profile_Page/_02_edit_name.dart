import 'package:eco_earth/Utils/_02_button.dart';
import 'package:eco_earth/Utils/_03_show_toast.dart';
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/landing_page.dart';
import 'package:eco_earth/pages/_05_Profile_Page/_01_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  static const route_name=edit_user_name;
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  bool isLoading=false;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  Future<void> updateUserValue(String name) async{
    await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: get_app_bar('Edit username', true),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                  width: 330,
                  child: Text(
                    "What's Your Name?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for First Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                            decoration:
                            const InputDecoration(labelText: 'First Name'),
                            controller: firstNameController,
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            // Handles Form Validation for Last Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                            decoration:
                            const InputDecoration(labelText: 'Last Name'),
                            controller: secondNameController,
                          )))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 60,
                        child: MyButton(buttonTitle: 'Update', isLoading: isLoading, onPressed: ()async{
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading=true;
                            });
                            await updateUserValue("${firstNameController.text} ${secondNameController.text}");
                            setState(() {
                              isLoading=true;
                            });
                            if(mounted){
                              showToast('Update Success !', Colors.green);
                              Navigator.of(context).pushNamedAndRemoveUntil(landing_route, (_)=>false);
                            }
                          }
                        }, btnColor: Colors.green),
                      )))
            ],
          ),
        ));
  }
}