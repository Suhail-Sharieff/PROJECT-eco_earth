import 'dart:developer';

import 'package:eco_earth/Utils/_03_show_toast.dart';
import 'package:eco_earth/enum/_01_signed_up_user_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthMethods {
  static final  instance = FirebaseAuth.instance;

  static Future<bool> signUp({required String email, required String password}) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showToast('Enter proper email/password !', Colors.blueAccent);
        return false;
      }
      await instance.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      showToast(e.toString(), Colors.red);
    }
    return false;
  }



  static Future<SignedUpUserStatus> signIn({required String email, required String password}) async {
    try {

      final res=await instance.signInWithEmailAndPassword(
          email: email, password: password);
      if(res.user!.emailVerified){

        //also create this user in Supabase
        await Supabase.instance.client.from('users').insert({
          'firebase_uid':instance.currentUser!.uid,
          'user_name':instance.currentUser!.displayName
        });

        return SignedUpUserStatus.IS_EMAIL_VERFIED;
      }
      return SignedUpUserStatus.IS_NOT_EMAIL_VERFIED;
    } on FirebaseAuthException catch (e) {
      showToast(e.message.toString(), Colors.red);
    }
    return SignedUpUserStatus.INVALID;
  }

  static Future<void>sendVerifyLink()async{
    try{
      await instance.currentUser?.sendEmailVerification();
    }catch(e){
      showToast("Some error occured in sending mail !", Colors.red);
    }
  }


  static Future<void>logout()async{
    try{
      await instance.signOut();
    }catch(e){
      showToast("Some error occured in logging out !", Colors.red);
    }
  }

}
