import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/_02_vendor_model/vendor.dart';
import '../../models/_03_contract_model/contract.dart';

class ContractController extends GetxController {
  final instance = Supabase.instance.client;
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> place_contract_to(
      Vendor v, Map<String, dynamic> item_number_map) async {
    await instance.from('contracts').insert({
      'contract_status': 'PENDING',
      'from_id': user.uid,
      'customer_name': user.displayName!,
      'to_id': v.firebaseUid,
      'item_number_map': item_number_map,
    });
  }

  Stream<PostgrestList> getContracts() {
    try {
      final res = instance.from('contracts').stream(
        primaryKey: ['*'],
      ).eq('to_id', user.uid);
      return res;
    } catch (e) {
      log(e.toString());
      return Stream.error(e);
    }
  }

  Future<void> delete_completed_contracts() async {
    try {
      await instance
          .from('contracts')
          .delete()
          .eq('contract_status', 'COMPLETED');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> mark_as_completed(Contract c) async {
    try {
      await instance.from('contracts').update({
        'contract_status': 'COMPLETED',
      }).eq('id', c.id!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }



}
