import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (context) => const SplashScreen(),
  Routes.welcomeScreen: (context) => const WelcomeScreen(),
  Routes.loginScreen: (context) => const LoginScreen(),
  Routes.registerScreen: (context) => const RegisterScreen(),
  Routes.homeScreen: (context) => HomeScreen(),
  Routes.onboarding: (context) => const FirstScreen(),
};
