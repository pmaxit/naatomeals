import 'package:flutter/material.dart';
import 'package:naatomeals/screens/welcome/widgets/button.dart';

class OnBoardingPage extends StatelessWidget {
  final String pageName;

  final String imageUrl;
  final String messageHighlight;
  final String subMessage;

  const OnBoardingPage({
    super.key,
    required this.pageName,
    required this.imageUrl,
    required this.messageHighlight,
    required this.subMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageUrl),
                const SizedBox(height: 60),
                Text(messageHighlight,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        )),
                const SizedBox(height: 5),
                Container(
                  width: 200,
                  child: Text(subMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey,
                          )),
                ),
              ],
            )));
  }
}
