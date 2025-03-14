import 'dart:developer';

import 'package:eco_earth/models/_02_vendor_model/vendor.dart';
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
}
