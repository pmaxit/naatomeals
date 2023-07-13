import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:naatomeals/extensions/dynamic_padding.dart';
import '../../utils/styles.dart';
import '../welcome/widgets/button.dart';

class RegisterContent extends HookWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    // column with three regions
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.responsive<double>(24.0,
              sm: 12.0, md: 24.0, lg: 24.0, xl: 24.0)),
      child: Column(children: [
        // top region
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ]),
          ),
        ),
        // middle region
        Expanded(
            flex: 4,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Wrap(
                runSpacing: 8,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person, color: orangeColor),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email, color: orangeColor),
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: orangeColor)),
                  ),
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
                ],
              ),
              SizedBox(height: context.responsive<double>(48, sm: 12)),
              AppButton(
                  text: "Register",
                  onTap: () {
                    print(nameController.text);
                    print(emailController.text);
                    print(passwordController.text);
                    // refresh provider

                    Navigator.popAndPushNamed(context, 'home_screen');
                  }),
              const SizedBox(height: 12),
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
            ])),

        // bottom region
        Expanded(
            flex: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
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
                              const Icon(FontAwesomeIcons.twitter,
                                  color: Colors.blue),
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

                  const SizedBox(height: 24),
                  // buttons for twitter and facebook rounded

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
                ])),
      ]),
    ));
  }
}
