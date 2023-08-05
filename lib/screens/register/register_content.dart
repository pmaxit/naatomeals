import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/extensions/dynamic_padding.dart';
import '../../services/auth.dart';
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
              const Divider(height: 1),
              Text(
                "Let's get started ",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 5),
              Text("Enter the following details to sign up",
                  style: textTheme.titleSmall),
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
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person, color: orangeColor),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: orangeColor),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone, color: orangeColor),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: orangeColor)),
              ),
            ),
            const Divider(),
            AppButton(
              text: "Sign up",
              onTap: () {
                // auth.signUpWithEmailAndPassword(
                //   email: emailController.text,
                //   password: passwordController.text,
                //   name: nameController.text,
                //   phone: phoneController.text,
                // );

                auth.signInAnonymously();
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
            Text(
              "Already a member? ",
              style: textTheme.bodyText1?.copyWith(
                color: blackColor,
                fontSize: 16,
              ),
            ),
            Text(
              "Sign in",
              style: textTheme.bodyText1?.copyWith(
                color: orangeColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      Container(height: 100, width: double.infinity, color: Colors.transparent)
    ]);
  }
}
