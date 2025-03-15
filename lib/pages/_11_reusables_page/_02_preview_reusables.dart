import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ReusablesPage extends StatefulWidget {
  static const route_name=reusables_page;
  const ReusablesPage({super.key});

  @override
  State<ReusablesPage> createState() => _ReusablesPageState();
}

class _ReusablesPageState extends State<ReusablesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Reusables', true),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(reusables_adding_page);
        },
        tooltip: 'Contribute',
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
