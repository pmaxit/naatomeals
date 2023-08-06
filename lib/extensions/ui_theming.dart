import 'package:flutter/material.dart';

import '../utils/styles.dart';

const grayScale = 150;

extension UIThemeExtension on BuildContext {
  // default TextTheme

  TextStyle get h1 => Theme.of(this).textTheme.displayLarge!;
  TextStyle get h2 => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get h3 => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get h4 => Theme.of(this).textTheme.titleLarge!;
  TextStyle get h5 => Theme.of(this).textTheme.titleMedium!;
  TextStyle get h6 => Theme.of(this).textTheme.titleSmall!;
  TextStyle get body1 => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get body2 => Theme.of(this).textTheme.bodySmall!;
  TextStyle get label => Theme.of(this).textTheme.labelLarge!;

  // create text style with grey shade color
  TextStyle get greyH1 => Theme.of(this)
      .textTheme
      .displayLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyH2 => Theme.of(this)
      .textTheme
      .headlineMedium!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyH3 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyH4 => Theme.of(this)
      .textTheme
      .titleLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyH5 => Theme.of(this)
      .textTheme
      .titleMedium!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyH6 => Theme.of(this)
      .textTheme
      .titleSmall!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyBody1 => Theme.of(this)
      .textTheme
      .bodyLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyBody2 => Theme.of(this)
      .textTheme
      .bodySmall!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  TextStyle get greyLabel => Theme.of(this)
      .textTheme
      .labelLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary.withAlpha(grayScale));

  // primary textTheme
  TextStyle get primaryH1 => Theme.of(this)
      .textTheme
      .displayLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryH2 => Theme.of(this)
      .textTheme
      .headlineMedium!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryH3 => Theme.of(this)
      .textTheme
      .headlineSmall!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryH4 => Theme.of(this)
      .textTheme
      .titleLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryH5 => Theme.of(this)
      .textTheme
      .titleMedium!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryH6 => Theme.of(this)
      .textTheme
      .titleSmall!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryBody1 => Theme.of(this)
      .textTheme
      .bodyLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryBody2 => Theme.of(this)
      .textTheme
      .bodySmall!
      .copyWith(color: Theme.of(this).colorScheme.primary);
  TextStyle get primaryLabel => Theme.of(this)
      .textTheme
      .labelLarge!
      .copyWith(color: Theme.of(this).colorScheme.primary);
}
