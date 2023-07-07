import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/screens/welcome/widgets/logo.dart';

import '../../utils/provider/shared_preferences_providers.dart';
import 'widgets/button.dart';
import 'widgets/food_images.dart';

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkThemeActive =
        ref.watch(preferenceSettingsProvider).isDarkThemeActive;

    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        // appBar: AppBar(title: Text('Welcome Screen'), actions: [
        //   // switch for light / dark theme
        //   Switch(
        //     value: isDarkThemeActive,
        //     onChanged: (value) {
        //       Provider.of<PreferenceSettingsProvider>(context, listen: false)
        //           .toggleTheme(value);
        //     },
        //   ),
        // ]),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
                width: double.infinity,
                height: size.height * 0.7,
                child: Stack(children: [
                  FoodImage(
                      start: -1.36,
                      y: -0.7,
                      image: Image.asset('assets/images/images.jpeg'),
                      width: 180,
                      height: 180),
                  FoodImage(
                      start: 1.4,
                      y: -1.2,
                      image: Image.asset('assets/images/1.png'),
                      width: 159,
                      height: 159),
                  FoodImage(
                      start: 0.31,
                      y: -0.4,
                      image:
                          Image.asset('assets/images/Indian_Homemade_food.jpg'),
                      width: 109,
                      height: 109),
                  FoodImage(
                      start: 1.25,
                      y: 0.1,
                      image: Image.asset('assets/images/2.png'),
                      width: 130,
                      height: 130),
                  const Align(
                      alignment: AlignmentDirectional(0, 0.5),
                      child: SizedBox(width: 243, height: 165, child: Logo()))
                ])),
            SizedBox(
              height: size.height * 0.14,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: AppButton(
                text: "Next",
                onTap: () {
                  Navigator.pushNamed(context, 'register_screen');
                },
              ),
            )
          ],
        ));
  }
}
