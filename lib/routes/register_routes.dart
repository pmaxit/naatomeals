import 'package:flutter/material.dart';
import 'package:naatomeals/screens/restaurants/restaurant_page.dart';

import '../screens/register/wrapper_screen.dart';
import '../screens/screens.dart';
import 'routes.dart';

Map<String, WidgetBuilder> routesApp = {
  Routes.splashScreen: (context) => const SplashScreen(),
  Routes.welcomeScreen: (context) => const WelcomeScreen(),
  Routes.loginScreen: (context) => const LoginScreen(),
  Routes.registerScreen: (context) => const RegisterScreen(),
  Routes.homeScreen: (context) => const HomeScreen(),
  Routes.onboarding: (context) => const FirstScreen(),
  Routes.restaurantPage: (context) => const RestaurantsDetailPage(),
  Routes.wrapperScreen: (context) => const Wrapper(),
};
