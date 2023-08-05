import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/screens/welcome/widgets/button.dart';
import 'package:naatomeals/services/auth.dart';

import '../../utils/styles.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  Widget buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // scrollable
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text("Profile"),
          titleTextStyle: textTheme.headlineSmall!.copyWith(color: blackColor),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2OxUachoL-LCBADIK9URUqE7j2ZmFjHXI9A&usqp=CAU")),
              ),
            )
          ]),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.2),
                    ],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Naato Meals',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  buildListTile(
                    context,
                    'My Orders',
                    Icons.shopping_cart,
                    () {},
                  ),
                  buildListTile(
                    context,
                    'Settings',
                    Icons.settings,
                    () {},
                  ),
                  buildListTile(
                    context,
                    'About',
                    Icons.info,
                    () {},
                  ),
                  buildListTile(
                    context,
                    'Logout',
                    Icons.logout,
                    () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: AppButton(
                  text: "Logout",
                  onTap: () {
                    ref.read(authProvider).signOut();
                  }),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
