import 'dart:math';

import 'package:eco_earth/models/_01_complaint_model/complaint.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ComplaintController extends GetxController {
  final instance = Supabase.instance.client;
  final finstance = FirebaseAuth.instance.currentUser!;

  Future<void> add_complaint(
      String photo_url, String location, String description) async {
    try {
      Complaint newCompl = Complaint(
          photoUrl: photo_url,
          firebaseUid: finstance.uid,
          description: description,
          createdAt: DateTime.now().toIso8601String(),
          location: location,
          noOfLikes: 0);
      await instance.from('complaints').insert(newCompl);
    } catch (e) {
      print(e);
    }
  }
}
