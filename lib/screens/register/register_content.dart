import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../utils/styles.dart';
import '../welcome/widgets/button.dart';

class RegisterContent extends HookWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      // space
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // align items
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 55),
        Text(
          "Let's get started ",
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 5),
        Text("Enter the following details to sign up",
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: grayColor,
            )),
        const SizedBox(height: 28),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Name',
            prefixIcon: Icon(Icons.person, color: orangeColor),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email, color: orangeColor),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock, color: orangeColor)),
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text("Forgot Password?",
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
        const SizedBox(height: 32),
        AppButton(
            text: "Register",
            onTap: () {
              print(nameController.text);
              print(emailController.text);
              print(passwordController.text);

              Navigator.pushNamed(context, 'home_screen');
            }),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {},
            child: Text("Or Continue",
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
        const SizedBox(height: 20),
        // buttons for twitter and facebook rounded
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: InkWell(
                  onTap: () {},
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(FontAwesomeIcons.twitter, color: Colors.blue),
                      Text("Twitter",
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: InkWell(
                    onTap: () {},
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(FontAwesomeIcons.facebook,
                            color: Colors.blue),
                        Text("Facebook",
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 5,
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Already have an account?",
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: HexColor("#202020"),
                    )),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {},
                child: Text("Sign In",
                    style: textTheme.titleSmall?.copyWith(
                        // bold font
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: HexColor("#E62729"))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
