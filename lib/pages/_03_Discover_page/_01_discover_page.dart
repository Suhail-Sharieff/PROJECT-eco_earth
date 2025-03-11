import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/constants/_05_end_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  static const String route_name=discover_route;
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar("Discover News !", true),
      endDrawer: get_end_drawer(context),
    );
  }
}
