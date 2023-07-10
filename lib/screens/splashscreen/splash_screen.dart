import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // @TODO: add animations in the splash screen

    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.popAndPushNamed(context, 'onboarding_screen');
      });
      return null;
    }, []);

    // a network cached image with food image
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                'assets/images/Naato Meals Logo.png',
                height: 400,
                width: 300,
                fit: BoxFit.contain,
              ),
            )));
  }
}
