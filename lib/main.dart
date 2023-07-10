import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/routes/routes.dart';
import 'package:naatomeals/utils/helper/shared_preferences.dart';
import 'package:naatomeals/utils/provider/shared_preferences_providers.dart';
import 'package:provider/provider.dart';

import 'routes/register_routes.dart';
import 'utils/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
      initialRoute: Routes.onboarding,
      routes: routesApp,
      home: const Scaffold(
        body: Center(
          child: Text('Naato Meals'),
        ),
      ),
    );
  }
}
