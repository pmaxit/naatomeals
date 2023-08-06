import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/auth.dart';
import '../../utils/provider/shared_preferences_providers.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // @TODO: add animations in the splash screen
    final auth = ref.watch(authProvider);
    final prProvider = ref.watch(preferenceSettingsProvider);
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        //auth.signOut();
        if (prProvider.isOnboardingDone)
          Navigator.pushNamed(context, 'register_screen');
        else
          Navigator.pushNamed(context, 'onboarding_screen');
      });
      return null;
    }, []);

    // a network cached image with food image
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
