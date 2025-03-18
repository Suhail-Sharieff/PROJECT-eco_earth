import 'dart:developer';

import 'package:eco_earth/models/_04_reusables/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class ReusableController extends GetxController{

  final fid=FirebaseAuth.instance.currentUser;
  final instance=Supabase.instance.client;

  Future<void> addReusable(String photoUrl,int selling_price,String title)async{
    try{
      final Reusable item=Reusable(
        title: title,
        owner: fid!.uid,
        cost: selling_price,
        photo_url: photoUrl,
      );
      await instance.from('reusables').insert(
        item
      );
    }catch(e){
      log(e.toString());
    }
  }


  Future<List<Map<String,dynamic>>>get_resuables_list()async{
    try{
      final res=await instance.from('reusables').select('*');
      return res;
    }catch(e){
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}