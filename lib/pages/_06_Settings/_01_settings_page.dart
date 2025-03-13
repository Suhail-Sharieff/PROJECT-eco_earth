import 'package:eco_earth/constants/_04_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../controllers/_02_settings_controller/_01_setting_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsController sc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: get_app_bar('Settings', true),
      body: Container(
        padding: const EdgeInsets.all(20),
        // color: const Color.fromRGBO(48, 68, 78, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingOption(
              title: 'Dark Mode',
              icon: sc.darkMode.value
                  ? Icons.mode_night_rounded
                  : Icons.wb_sunny,
              iconColor: Colors.red.shade500,
              trailing: Obx(() => _buildToggleSwitch(sc.darkMode.value)),
              onTap: sc.changeMode,
            ),
            const Divider(color: Color.fromRGBO(150, 167, 175, 1)),
            _buildSettingOption(
              title: 'Background Play',
              icon: FontAwesomeIcons.play,
              iconColor: Colors.yellow,
              trailing: _buildToggleSwitch(false),
            ),
            const Divider(color: Color.fromRGBO(150, 167, 175, 1)),
            _buildSettingOption(
              title: 'Change Language',
              icon: FontAwesomeIcons.language,
              iconColor: const Color.fromRGBO(61, 213, 152, 1),
              trailing: const Icon(
                FontAwesomeIcons.angleRight,
                color: Color.fromRGBO(150, 167, 175, 1),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required String title,
    required IconData icon,
    required Color iconColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: iconColor,
                  ),
                  child: Icon(icon, size: 17, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildToggleSwitch(bool isActive) {
    return Container(
      width: 60,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive
            ? const Color.fromRGBO(61, 213, 152, 1)
            : const Color(0xFF2A3C44),
      ),
      child: Row(
        mainAxisAlignment:
        isActive ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
