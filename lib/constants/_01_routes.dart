import 'package:eco_earth/main.dart';
import 'package:eco_earth/pages/_00_splash_screen.dart';
import 'package:eco_earth/pages/_01_login_page.dart';
import 'package:eco_earth/pages/_02_sign_up.dart';
import 'package:eco_earth/pages/_03_verfify_email.dart';
import 'package:eco_earth/pages/_04_forgot_password.dart';
import 'package:flutter/material.dart';

const splash_route='/splash/';
const home_route='/home/';
const login_route='/login/';
const signup_route='/signup';
const verify_email_route='/verify_email';
const forgot_password_route='forgot_password';



final Map<String, WidgetBuilder> routes = {
  SplashScreen.route_name:(_)=>const SplashScreen(home_route: home_route,),
  HomePage.route_name:(_)=>const HomePage(),
  LoginPage.route_name:(_)=>const LoginPage(),
  SignupPage.route_name:(_)=>const SignupPage(),
  VerifyEmailPage.route_name:(_)=>const VerifyEmailPage(),
  ForgotPassWordPage.route_name:(_)=>const ForgotPassWordPage(),
};