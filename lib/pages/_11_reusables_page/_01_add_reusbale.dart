import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddResusablesPage extends StatefulWidget {
  static const route_name=reusables_adding_page;
  const AddResusablesPage({super.key});

  @override
  State<AddResusablesPage> createState() => _AddResusablesPageState();
}

class _AddResusablesPageState extends State<AddResusablesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Add reusables', true),
      body: CircularProgressIndicator(),
    );
  }
}
