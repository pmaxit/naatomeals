import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:naatomeals/screens/screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstScreen extends HookWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // page controller
    final pageController = usePageController();

    List<dynamic> pages = List.generate(
      4,
      (index) => Container(
        color: Colors.orange[300],
        child: Center(
          child: Text(
            'Page ${index + 1}',
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    pages.add(Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Page ${pages.length + 1}',
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'register_screen');
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    ));

    //pages.add(RegisterScreen());

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.indigo,
                dotColor: Colors.grey,
                strokeWidth: 1.5,
                dotHeight: 7,
                dotWidth: 16,
                spacing: 4,
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
