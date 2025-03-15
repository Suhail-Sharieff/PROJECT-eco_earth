import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/_02_vendor_model/vendor.dart';
import '../../models/_03_contract_model/contract.dart';

class ContractController extends GetxController {
  final instance = Supabase.instance.client;
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> place_contract_to(Vendor v,Map<String,dynamic>item_number_map) async {
    Contract newContr = Contract(
        contract_status: 'PENDING',
        from_id: user.uid,
        customer_name: user.displayName!,
        to_id: v.firebaseUid,
        item_number_map:item_number_map,
      created_at: DateTime.timestamp()
    );
    await instance.from('contracts').insert(newContr);
  }

  Future<List<Contract>> getContracts() async {
    try {
      final res = await instance
          .from('contracts')
          .select('*')
          .eq('to_id', user.uid);

      // Assuming `res` is a List<dynamic> where each element is a Map<String, dynamic>
      return (res as List)
          .map((e) => Contract.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

}
