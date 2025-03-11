import 'package:eco_earth/constants/_02_images_names.dart';
import 'package:flutter/material.dart';

import '../pages/_05_Profile_Page/_01_profile_page.dart';
import '../pages/_06_Settings/_01_settings_page.dart';

AppBar get_app_bar(String title, bool isCenter) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    clipBehavior: Clip.hardEdge,
    // backgroundColor: Colors.blue,
    // foregroundColor: Colors.white,
    toolbarOpacity: 1,

    actions: [
      Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: CircleAvatar(
              maxRadius: 25,
              child: MyImages.user_image,
            ));
      }),
      SizedBox.fromSize(
        size: const Size.square(12),
      ),
    ],

  );
}
