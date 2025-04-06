import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeaderBoardController extends GetxController {
  final instance = Supabase.instance.client;
// Observable list of users

  Future<List<Map<String, dynamic>>> getLeaderBoard() async {
    final List<Map<String, dynamic>> res = await instance.from('users').select('*');

    return res;
  }
}

// Example User Model (Modify based on your database fields)
class User {
  final String user_name;
  final int user_points; // Example field

  User({ required this.user_name, required this.user_points});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_name: json['user_name'] ?? "You",
      user_points: json['user_points'],
    );
  }
}
