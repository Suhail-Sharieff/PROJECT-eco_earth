import 'dart:developer';

import 'package:eco_earth/models/_03_contract_model/contract.dart';
import 'package:eco_earth/models/_04_reusables/reusable.dart';
import 'package:eco_earth/models/_05_item_condition/item_condition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReusableController extends GetxController {
  final fid = FirebaseAuth.instance.currentUser;
  final instance = Supabase.instance.client;

  Future<void> addReusable(String photoUrl, int selling_price, String title,
      Map<String, dynamic> json) async {
    try {
      final Reusable item = Reusable(
        title: title,
        owner: fid!.uid,
        cost: selling_price,
        photo_url: photoUrl,
        condition: ItemCondition.fromJson(json),
      );
      await instance.from('reusables').insert(item);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> get_resuables_list() async {
    try {
      final res = await instance.from('reusables').select('*');
      return res;
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> buy_reusable(Reusable item, String buyer_uid) async {
    try {
      // update that item status as not in stock and buyer name
      Reusable newItemState = item.copyWith(
        status: 1,
        buyer: buyer_uid,
      );
      await instance
          .from('reusables')
          .update(newItemState.toJson())
          .eq('id', item.id!);
      await instance.from('contracts').insert(Contract(
            item_number_map: {item.title: item.cost},
            from_id: item.owner,
            to_id: buyer_uid,
            customer_name: FirebaseAuth.instance.currentUser!.displayName!,
            contract_status: "PENDING",
          ));
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> get_resuables_ordered_by_user() async {
    try {
      var res = await instance
          .from('reusables')
          .select('*')
          .eq('buyer', FirebaseAuth.instance.currentUser!.uid);
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }Future<List<Map<String, dynamic>>> get_resuables_sold_by_user() async {
    try {
      var res = await instance
          .from('reusables')
          .select('*')
          .eq('owner', FirebaseAuth.instance.currentUser!.uid);
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
