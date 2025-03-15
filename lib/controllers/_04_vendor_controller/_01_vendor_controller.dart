import 'dart:developer';

import 'package:eco_earth/models/_02_vendor_model/vendor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VendorController extends GetxController {
  final instance = Supabase.instance.client;

  Future<void> register_vendor(Vendor v) async {
    try {
      // print(v);
      await instance.from('vendors').insert(v);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<PostgrestList>get_vendors()async{
    try{
      var res=await instance.from('vendors').select('*');
      return(res);
    }catch(e){
      log(e.toString());
      throw Exception();
    }
  }


  Future<bool> curr_user_is_vendor()async{
    try{
      final res=await instance.from('vendors').select().eq('firebase_uid', FirebaseAuth.instance.currentUser!.uid).count(CountOption.exact);
      return( res.count!=0);
    }catch(e){
      log(e.toString());
    }
    return false;
  }

  Future<void>star_vendor(Vendor v)async{
    try{
      final res=await instance.from('vendors').select('vendor_rating').eq('firebase_uid', v.firebaseUid);
      print(res);
      await instance.from('vendors').update({
        'vendor_rating':res.first.values.elementAt(0)+1
      }).eq('firebase_uid', v.firebaseUid);
    }catch(e){
      log(e.toString());
    }
  }
}
