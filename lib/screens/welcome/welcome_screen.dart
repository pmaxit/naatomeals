import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../../utils/provider/shared_preferences_providers.dart';

class WelcomeScreen extends HookWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkThemeActive =
        Provider.of<PreferenceSettingsProvider>(context).isDarkThemeActive;

    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(title: Text('Welcome Screen'), actions: [
          // switch for light / dark theme
          Switch(
            value: isDarkThemeActive,
            onChanged: (value) {
              Provider.of<PreferenceSettingsProvider>(context, listen: false)
                  .toggleTheme(value);
            },
          ),
        ]),
        body: Center(
          child: Text('Welcome Screen', style: theme.displayLarge),
        ));
  }
}
