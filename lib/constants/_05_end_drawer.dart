import 'package:eco_earth/Utils/_02_button.dart';
import 'package:eco_earth/controllers/_01_auth_controllers/auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/_05_Profile_Page/_01_profile_page.dart';
import '../pages/_06_Settings/_01_settings_page.dart';
import '_02_images_names.dart';

Widget get_end_drawer(BuildContext context) {
  final Map<String, Widget> routeMap = {
    'Profile': const ProfilePage(),
    'Settings': const SettingsPage(),
  };
  return SafeArea(
    child: Drawer(
      elevation: 16.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          "${FirebaseAuth.instance.currentUser!.email}",
                          style: const TextStyle(
                              fontFamily: 'Inter', fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      CircleAvatar(
                        child: MyImages.user_image, // Adjust radius as needed
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: routeMap.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (_, idx) {
                  String title = routeMap.keys.elementAt(idx);
                  Widget toNavigate = routeMap.values.elementAt(idx);
                  return listTile(
                      con: context, title: title, toNavigate: toNavigate);
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 34),
            child: MyButton(
              buttonTitle: 'Logout',
              isLoading: false,
              onPressed: () async {
                await AuthMethods.logout();
              },
              btnColor: Colors.red,
            ),
          ),
        ],
      ),
    ),
  );
}

ListTile listTile(
    {required BuildContext con,
    required String title,
    String subtitle = '',
    Widget? toNavigate}) {
  return ListTile(
    title: Text(title, style: const TextStyle(fontFamily: 'Inter')),
    trailing: IconButton(
      icon: const Icon(Icons.arrow_forward_ios_rounded),
      color: Colors.red,
      onPressed: () {
        Navigator.of(con).push(MaterialPageRoute(builder: (_) => toNavigate!));
      },
    ),
    tileColor: Colors.white54,
    dense: false,
    contentPadding: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
