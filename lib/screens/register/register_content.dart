import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/extensions/dynamic_padding.dart';
import 'package:naatomeals/extensions/ui_theming.dart';
import '../../services/auth.dart';
import '../../utils/provider/shared_preferences_providers.dart';
import '../../utils/styles.dart';
import '../welcome/widgets/button.dart';

class RegisterContent extends HookConsumerWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final phoneController = useTextEditingController();

    // auth provider
    final auth = ref.read(authProvider);
    final prProvider = ref.watch(preferenceSettingsProvider);

    final textFieldSelected = useState({
      'name': false,
      'email': false,
      'password': false,
      'phone': false,
    });

    final toggleField = useCallback((String field) {
      // turn off all the values
      textFieldSelected.value.forEach((key, value) {
        textFieldSelected.value[key] = false;
      });

      // take appropriate action on the selected one
      textFieldSelected.value = {...textFieldSelected.value, field: true};
    }, []);

    // column with three regions
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.responsive<double>(24.0,
                sm: 12.0, md: 24.0, lg: 24.0, xl: 24.0)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Text(
                "Let's get started ",
                style: context.primaryH4,
              ),
              const SizedBox(height: 5),
              Text("Enter the following details to sign up",
                  style: context.greyH6),
            ]),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.responsive<double>(24.0,
                sm: 12.0, md: 24.0, lg: 24.0, xl: 24.0)),
        child: Wrap(
          runSpacing: 12,
          children: [
            Material(
              color: Colors.transparent,
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.secondary,
                controller: nameController,
                onTap: () {
                  print("on Tap");
                  toggleField('name');
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person,
                      color: textFieldSelected.value['name']!
                          ? orangeColor
                          : grayColor),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  toggleField('email');
                },
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email,
                      color: textFieldSelected.value['email']!
                          ? orangeColor
                          : grayColor),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  toggleField('phone');
                },
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone,
                      color: textFieldSelected.value['phone']!
                          ? orangeColor
                          : grayColor),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    toggleField('password');
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock,
                          color: textFieldSelected.value['password']!
                              ? orangeColor
                              : grayColor))),
            ),

            AppButton(
              text: "Sign up",
              onTap: () async {
                // auth.signUpWithEmailAndPassword(
                //   email: emailController.text,
                //   password: passwordController.text,
                //   name: nameController.text,
                //   phone: phoneController.text,
                // );

                await auth.signInAnonymously();
                Navigator.pushNamed(context, 'home_screen');
              },
            ),
            // Signup button
          ],
        ),
      ),
      const SizedBox(height: 16),
      Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already a member? ", style: context.greyBody1),
            Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    prProvider.resetOnBoardingDone();
                    Navigator.popAndPushNamed(context, 'splash_screen');
                  },
                  child: Text("Sign in",
                      style: context.greyBody1.copyWith(
                        color: orangeColor,
                        decoration: TextDecoration.none,
                      ))),
            ),
          ],
        ),
      ),
    ]);
  }
}
