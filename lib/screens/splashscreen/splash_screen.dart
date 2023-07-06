import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.popAndPushNamed(context, 'welcome_screen');
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
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: Image.asset('assets/images/Background.png').image,
              fit: BoxFit.cover,
            )),
            child: Center(
              child: Image.asset(
                'assets/images/Naato Meals Logo.png',
                height: 500,
                width: 300,
                fit: BoxFit.contain,
              ),
            )));
  }
}
