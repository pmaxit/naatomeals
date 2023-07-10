import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'screen.dart';

class FirstScreen extends HookWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // page controller
    final pageController = usePageController();

    List<dynamic> pages = const [
      OnBoardingPage(
          pageName: 'first_screen',
          imageUrl: 'assets/images/group-5.png',
          messageHighlight: 'Order Home\'s Food',
          subMessage: 'Just like how your mother cooked!'),
      OnBoardingPage(
          pageName: 'second_screen',
          imageUrl: 'assets/imagse/group-6.png',
          messageHighlight: 'Free Home Delivery',
          subMessage: 'We deliver to your doorstep!'),
      OnBoardingPage(
          pageName: 'Subscription Service',
          imageUrl: 'assets/images/group-7.png',
          messageHighlight: 'Monthly Subscription plans',
          subMessage: 'No hassle of order everyday. Just subscribe!'),
    ];

    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        if (pageController.page == pages.length - 1) {
          Navigator.pushReplacementNamed(context, 'regiter_screen');
        } else {
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      });
      return null;
    }, []);

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
          const SizedBox(height: 16),
        ],
      ),
    )));
  }
}