import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/controllers/_01_auth_controllers/auth_methods.dart';
import 'package:flutter/material.dart';

import '_01_login_page.dart';
import '_03_verfify_email.dart';

class SignupPage extends StatefulWidget {
  static String route_name = signup_route;
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.purple.withOpacity(0.6), // Cyan/Turquoise
                      const Color(0x00FFFFFF),
                    ],
                    begin: const AlignmentDirectional(0.0, -1.0),
                    end: const AlignmentDirectional(0, 1.3),
                    stops: const [0.0, 1.0],
                  )),
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
                            Icons.app_registration,
                            color: Colors.blue,
                            size: 44.0,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Sign Up',
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
                          'Create an account to sign in',
                          style: TextStyle(
                            letterSpacing: 0.0,
                          ),
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
                      SizedBox.fromSize(
                        size: const Size(23, 23),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          if (await AuthMethods.signUp(
                              email: emailController.text,
                              password: passwordController.text)) {
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
                            'Sign Up',
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
                          const Text('Already Have an Accout?'),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(LoginPage.route_name);
                            },
                            child: const Text(
                              'Login',
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
