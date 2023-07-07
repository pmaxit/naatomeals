import 'package:flutter/material.dart';

import '../welcome/widgets/logo.dart';
import 'register_content.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/14.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 106),
                Logo(width: 218, height: 148),
                RegisterContent(),
              ],
            )),
      ),
    );
  }
}
