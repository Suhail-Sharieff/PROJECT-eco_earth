import 'package:eco_earth/pages/_01_auth_pages/_00_splash_screen.dart';
import 'package:eco_earth/pages/_01_auth_pages/_01_login_page.dart';
import 'package:eco_earth/pages/_01_auth_pages/_03_verfify_email.dart';
import 'package:eco_earth/pages/_02_Home_page/_01_home_page.dart';
import 'package:eco_earth/pages/_04_Leaderboard_page/_01_leader_board.dart';
import 'package:flutter/material.dart';

import '../pages/_01_auth_pages/_02_sign_up.dart';
import '../pages/_01_auth_pages/_04_forgot_password.dart';
import '../landing_page.dart';

const splash_route='/splash/';
//---------auth pages

const login_route='/login/';
const signup_route='/signup/';
const verify_email_route='/verify_email/';
const forgot_password_route='forgot_password/';
//-------after login pages
const landing_route='/landing/';
const home_route='/home/';
const discover_route='/discover/';
const leader_board_route='/leader_board/';




final Map<String, WidgetBuilder> routes = {
  SplashScreen.route_name:(_)=>const SplashScreen(home_route: home_route,),
  Landing_page.route_name:(_)=>const Landing_page(),
  HomePage.route_name:(_)=>const HomePage(),
  LoginPage.route_name:(_)=>const LoginPage(),
  SignupPage.route_name:(_)=>const SignupPage(),
  VerifyEmailPage.route_name:(_)=>const VerifyEmailPage(),
  ForgotPassWordPage.route_name:(_)=>const ForgotPassWordPage(),
  LeaderBoardPage.route_name:(_)=>const LeaderBoardPage(),
};