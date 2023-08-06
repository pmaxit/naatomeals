import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../welcome/widgets/logo.dart';
import 'register_content.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Login Back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          // No bouncing
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              automaticallyImplyLeading: false,
              expandedHeight: 0.25 * size.height,
              backgroundColor: Colors.transparent,
              flexibleSpace: const FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                  ],
                  background: Center(
                      child: Align(
                          alignment: Alignment.bottomCenter, child: Logo()))),
            ),
            const SliverToBoxAdapter(child: RegisterContent()),
          ],
        ),
      ),
    );
  }
}
