import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/pages/_01_login_page.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatefulWidget {

  static String route_name=verify_email_route;
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final emailAddressTextController = TextEditingController();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 28.0,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(LoginPage.route_name);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title section
              const SizedBox(height: 40),
              const Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We will send you an email with a link to reset your password. Please enter the email associated with your account below.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black.withOpacity(0.6),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              // Email input field
              TextFormField(
                controller: emailAddressTextController,
                autofillHints: [AutofillHints.email],
                decoration: InputDecoration(
                  labelText: 'Your email address',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: 'Enter your email...',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
              ),

              const SizedBox(height: 40),

              // Send Link button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Send Link pressed...');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}