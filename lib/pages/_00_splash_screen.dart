import 'package:eco_earth/constants/_01_routes.dart';
import 'package:eco_earth/main.dart';
import 'package:eco_earth/pages/_01_login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const route_name=splash_route;
  const SplashScreen({super.key, required this.home_route});
  final String home_route;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, LoginPage.route_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             GradientText(
              'Bismillah',
              style: const TextStyle(fontSize: 40),
              gradient: LinearGradient(colors: [
                Colors.red,
                Colors.blue.shade400,
                Colors.blue.shade900,
              ]),
            ),
            SizedBox.fromSize(size: Size(34, 34),),
            const SizedBox(height:100,
                width: 50,
                child: Image(image: AssetImage('assets/images/img.png'))),
          ],
        ),
      ),
    );
  }
}
class GradientText extends StatelessWidget {
  const GradientText(
      this.text, {super.key,
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}