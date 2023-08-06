import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/routes/routes.dart';
import 'package:naatomeals/utils/provider/shared_preferences_providers.dart';

import 'routes/register_routes.dart';
import 'utils/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   window_size.DesktopWindow.setMinWindowSize(const Size(460, 950));
  //   window_size.DesktopWindow.setMaxWindowSize(const Size(600, 1000));
  // }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NewAppTheme apptheme = NewAppTheme();
    final prProvider = ref.watch(preferenceSettingsProvider);
    return MaterialApp(
      title: 'Naato Meals',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: apptheme.darkTheme,
      initialRoute: Routes.splashScreen,
      routes: routesApp,
    );
  }
}
