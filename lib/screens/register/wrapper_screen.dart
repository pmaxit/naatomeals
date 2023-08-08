import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/screens/screens.dart';

import '../../services/auth.dart';
import '../../utils/provider/shared_preferences_providers.dart';
import '../home/home_screen.dart';
import '../onboarding/screen.dart';
import '../splashscreen/splash_screen.dart';
import 'register_screen.dart';

class Wrapper extends HookConsumerWidget {
  final User? user;
  const Wrapper({super.key, this.user});

  Widget _buildContent(
      User? user, PreferenceSettingsProvider sharedPreference) {
    print('>>>>>>>>>>>>>>>>>>>>> user: $user');
    if (user == null) {
      if (sharedPreference.isOnboardingDone) {
        return const RegisterScreen();
      }
      return const FirstScreen();
    }
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateChangesProvider);
    final sharedPreferenceProvider =
        ref.read(preferenceSettingsProvider.notifier);

    return auth.when(
      data: (user) {
        return _buildContent(user, sharedPreferenceProvider);
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (error, stackTrace) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
