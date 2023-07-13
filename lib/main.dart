import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/routes/routes.dart';
import 'package:naatomeals/utils/helper/shared_preferences.dart';
import 'package:naatomeals/utils/provider/shared_preferences_providers.dart';
import 'package:provider/provider.dart';
import 'package:desktop_window/desktop_window.dart' as window_size;

import 'routes/register_routes.dart';
import 'utils/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    window_size.DesktopWindow.setMinWindowSize(const Size(460, 950));
    window_size.DesktopWindow.setMaxWindowSize(const Size(600, 1000));
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prProvider = ref.watch(preferenceSettingsProvider);
    return MaterialApp(
      title: 'Naato Meals',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: prProvider.themeData,
      initialRoute: Routes.homeScreen,
      routes: routesApp,
      home: const Scaffold(
        body: Center(
          child: Text('Naato Meals'),
        ),
      ),
    );
  }
}
