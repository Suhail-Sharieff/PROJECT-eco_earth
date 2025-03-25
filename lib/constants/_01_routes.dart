import 'package:eco_earth/pages/_01_auth_pages/_00_splash_screen.dart';
import 'package:eco_earth/pages/_01_auth_pages/_01_login_page.dart';
import 'package:eco_earth/pages/_01_auth_pages/_03_verfify_email.dart';
import 'package:eco_earth/pages/_02_Home_page/_01_home_page.dart';
import 'package:eco_earth/pages/_04_Leaderboard_page/_01_leader_board.dart';
import 'package:eco_earth/pages/_05_Profile_Page/_01_profile_page.dart';
import 'package:eco_earth/pages/_05_Profile_Page/_02_edit_name.dart';
import 'package:eco_earth/pages/_05_Profile_Page/_03_edit_phone.dart';
import 'package:eco_earth/pages/_07_complaints_page/_01_complaints_page.dart';
import 'package:eco_earth/pages/_08_vendor_registeration_page/_01_vendor_registeration.dart';
import 'package:eco_earth/pages/_09_recycling_centres_page/_01_recycling_centres_page.dart';
import 'package:eco_earth/pages/_11_reusables_page/_01_add_reusbale.dart';
import 'package:eco_earth/pages/_11_reusables_page/_02_preview_reusables.dart';
import 'package:eco_earth/pages/_12_Dashboard/_01_dashboard.dart';
import 'package:flutter/material.dart';

import '../pages/_01_auth_pages/_02_sign_up.dart';
import '../pages/_01_auth_pages/_04_forgot_password.dart';
import '../landing_page.dart';
import '../pages/_13_notificatons/_01_notifications_page.dart';

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
const profile_route='/profile/';
const edit_user_name='/edit_user_name/';
const edit_user_ph_no='/edit_user_ph_no/';
const complaint_route='/complaints/';
const vendor_registration_route='/vendor_registration_page/';
const recycling_centres_routes='/recycling_centres_page/';
const reusables_adding_page_route='/add_reusable/';
const reusables_page_route='/reusables/';
const dashboard_route='/dashboard/';
const notification_route='/notifications/';




final Map<String, WidgetBuilder> routes = {
  SplashScreen.route_name:(_)=>const SplashScreen(home_route: home_route,),
  Landing_page.route_name:(_)=>const Landing_page(),
  HomePage.route_name:(_)=>const HomePage(),
  LoginPage.route_name:(_)=>const LoginPage(),
  SignupPage.route_name:(_)=>const SignupPage(),
  VerifyEmailPage.route_name:(_)=>const VerifyEmailPage(),
  ForgotPassWordPage.route_name:(_)=>const ForgotPassWordPage(),
  LeaderBoardPage.route_name:(_)=>const LeaderBoardPage(),
  ProfilePage.route_name:(_)=>const ProfilePage(),
  EditNameFormPage.route_name:(_)=>const EditNameFormPage(),
  EditPhoneFormPage.route_name:(_)=>const EditPhoneFormPage(),
  ComplaintsPage.route_name:(_)=>const ComplaintsPage(),
  VendorRegistrationPage.route_name:(_)=>const VendorRegistrationPage(),
  RecyclingCentres.route_name:(_)=>const RecyclingCentres(),
  AddReusablesPage.route_name:(_)=> AddReusablesPage(),
  ReusablesPage.route_name:(_)=>const ReusablesPage(),
  DashBoardPage.route_name:(_)=>const DashBoardPage(),
  NotificationsPage.route_name:(_)=>const NotificationsPage(),
};