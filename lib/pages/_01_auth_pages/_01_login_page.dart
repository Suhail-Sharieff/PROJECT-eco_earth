import 'package:eco_earth/controllers/_01_auth_controllers/auth_methods.dart';
import 'package:eco_earth/enum/_01_signed_up_user_status.dart';
import 'package:eco_earth/landing_page.dart';
import 'package:eco_earth/pages/_01_auth_pages/_03_verfify_email.dart';
import 'package:flutter/material.dart';

import '../../constants/_01_routes.dart';
import '../_02_Home_page/_01_home_page.dart';
import '_02_sign_up.dart';
import '_04_forgot_password.dart';

class LoginPage extends StatefulWidget {
  static String route_name = login_route;
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset:
              true, // Ensures the screen resizes when the keyboard appears
          body: SingleChildScrollView(
            // Makes the whole page scrollable
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pink.withOpacity(0.6), // Cyan/Turquoise
                        const Color(
                            0x00FFFFFF), // Transparent (adjust if needed)
                      ],
                      begin: const AlignmentDirectional(0.0, -1.0),
                      end: const AlignmentDirectional(0, 1.3),
                      stops: [0.0, 1.0],
                    ),
                  ),
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.animation,
                            color: Colors.blue,
                            size: 44.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Use the account below to sign in.',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      // Email or Username field
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email or Username',
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 20), // Space between fields
                      // Password field
                      TextFormField(
                        controller: passwordController,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 10), // Space between fields
                      // Forgot Password button
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPassWordPage.route_name);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      // Sign In button
                      TextButton.icon(
                        onPressed: () async {
                          // Navigator.of(context).pushNamed(HomePage.route_name);
                          SignedUpUserStatus st = await AuthMethods.signIn(
                              email: emailController.text,
                              password: passwordController.text);
                          if (st == SignedUpUserStatus.IS_EMAIL_VERFIED) {
                            if(mounted) {
                              Navigator.of(context)
                                .pushNamedAndRemoveUntil(Landing_page.route_name,(_)=>false);
                            }
                          } else if (st ==
                              SignedUpUserStatus.IS_NOT_EMAIL_VERFIED) {
                            if(mounted) {
                              Navigator.of(context)
                                .pushNamed(VerifyEmailPage.route_name);
                            }
                          }
                        },
                        icon: const Icon(Icons.login),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Space between buttons
                      // Sign Up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(SignupPage.route_name);
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
