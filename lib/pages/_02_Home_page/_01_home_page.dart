import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_02_images_names.dart';
import 'package:eco_earth/constants/_05_end_drawer.dart';
import 'package:eco_earth/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/_04_appbar.dart';

class HomePage extends StatefulWidget {
  static final String route_name = home_route;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Home', true),
      endDrawer: get_end_drawer(context),
    );
  }
}
