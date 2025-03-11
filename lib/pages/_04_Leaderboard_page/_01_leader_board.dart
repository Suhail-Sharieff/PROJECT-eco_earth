import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:eco_earth/constants/_05_end_drawer.dart';
import 'package:flutter/material.dart';

class LeaderBoardPage extends StatefulWidget {
  static const String route_name=leader_board_route;
  const LeaderBoardPage({super.key});

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar("Leaderboard !", true),
      endDrawer: get_end_drawer(context),
    );
  }
}
