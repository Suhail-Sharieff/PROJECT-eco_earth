import 'package:eco_earth/constants/_01_routes.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key, required this.home});
  final Widget home;

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  Future<void> navigateToHome()async{
    await Future.delayed(const Duration(seconds: 3));
    if(mounted) Navigator.of(context).pushReplacementNamed(login_route);
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
            SizedBox.fromSize(size: const Size(34, 34),),
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