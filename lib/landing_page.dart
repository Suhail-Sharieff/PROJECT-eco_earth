
import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/pages/_02_Home_page/_01_home_page.dart';
import 'package:eco_earth/pages/_03_Discover_page/_01_discover_page.dart';
import 'package:eco_earth/pages/_04_Leaderboard_page/_01_leader_board.dart';
import 'package:eco_earth/pages/_05_Profile_Page/_01_profile_page.dart';
import 'package:eco_earth/pages/_06_Settings/_01_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Landing_page extends StatefulWidget {
  static const String route_name=landing_route;
  const Landing_page({super.key});

  @override
  State<Landing_page> createState() => _Landing_pageState();
}

class _Landing_pageState extends State<Landing_page> {

  int currPageIdx=0;

  void onChange(int idx){
    setState(() {
      currPageIdx=idx;
    });
  }
  late final List<Widget>pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      const HomePage(),
      const DiscoverPage(),
      const LeaderBoardPage()
    ];
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currPageIdx],
      bottomNavigationBar: get_nav_bar(currPageIdx, onChange),
    );
  }
}


NavigationBar get_nav_bar(int currentPageIndex,Function(int) onChange) {
  return NavigationBar(
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    selectedIndex: currentPageIndex,
    onDestinationSelected: onChange,
    destinations: const <Widget>[
      NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.house),
        label: 'Home',
      ),
      NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.solidNewspaper),
        label: 'Discover',
      ),

      NavigationDestination(
        icon: FaIcon(FontAwesomeIcons.rankingStar),
        label: 'Map',
      ),
    ],
  );
}


