import 'dart:ui';

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
      onTap: tapHandler as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // scrollable
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 4,
          surfaceTintColor: Colors.transparent,
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [orangeColor, yellowColor],
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'Welcome Guest',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                      ),
                    ])),
            ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
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
                  () async {
                    await ref.read(authProvider).signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'register_screen', (route) => false);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
