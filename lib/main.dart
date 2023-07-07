import 'package:flutter/material.dart';
import 'package:naatomeals/routes/routes.dart';
import 'package:naatomeals/utils/helper/shared_preferences.dart';
import 'package:naatomeals/utils/provider/shared_preferences_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/register_routes.dart';
import 'utils/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PreferenceSettingsProvider(
                preferenceSettingsHelper: PreferenceSettingsHelper(
                    sharedPreferences: SharedPreferences.getInstance()))),
      ],
      child: Consumer<PreferenceSettingsProvider>(
          builder: (context, preferenceSettingsProvider, _) {
        return MaterialApp(
          title: 'Naato Meals',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: preferenceSettingsProvider.themeData,
          initialRoute: Routes.splashScreen,
          routes: routesApp,
          home: const Scaffold(
            body: Center(
              child: Text('Naato Meals'),
            ),
          ),
        );
      }),
    );
  }
}
