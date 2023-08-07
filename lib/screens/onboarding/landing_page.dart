import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/provider/shared_preferences_providers.dart';
import 'screen.dart';

class FirstScreen extends HookConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // page controller
    final pageController = usePageController(initialPage: 0);
    final prProvider = ref.watch(preferenceSettingsProvider);

    List<dynamic> pages = const [
      OnBoardingPage(
          pageName: 'first_screen',
          imageUrl: 'assets/images/group-5.png',
          messageHighlight: 'Order Home\'s Food',
          subMessage: 'Just like how your mother cooked!'),
      OnBoardingPage(
          pageName: 'second_screen',
          imageUrl: 'assets/images/group-6.png',
          messageHighlight: 'Free Home Delivery',
          subMessage: 'We deliver to your doorstep!'),
      OnBoardingPage(
          pageName: 'Subscription Service',
          imageUrl: 'assets/images/group-7.png',
          messageHighlight: 'Monthly Subscription plans',
          subMessage: 'No hassle of order everyday. Just subscribe!'),
    ];

    useEffect(() {
      // scroll through all the pages
      Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        if (pageController.hasClients == false) return;
        if (pageController.page == pages.length - 1) {
          timer.cancel();
          // push to the next screen
          Navigator.popAndPushNamed(context, 'register_screen');
          // onboarding done
          prProvider.setOnboardingDone(false);
        } else {
          pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      });
      return null;
    }, []);

    return OnBoarding(pageController: pageController, pages: pages);
  }
}

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    super.key,
    required this.pageController,
    required this.pages,
  });

  final PageController pageController;
  final List pages;

  @override
  Widget build(BuildContext context) {
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
            child: Stack(children: [
              SizedBox(
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).colorScheme.secondary,
                      dotColor: Colors.grey,
                      strokeWidth: 1.5,
                      dotHeight: 7,
                      dotWidth: 16,
                      spacing: 4,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    if (pageController.hasClients == false) return;
                    if (pageController.page == pages.length - 1) {
                      // push to the next screen
                      Navigator.popAndPushNamed(context, 'register_screen');
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              // next icon
            ]),
          ),
          const SizedBox(height: 16),
        ],
      ),
    )));
  }
}
