import 'package:flutter/material.dart';
import 'package:naatomeals/screens/restaurants/widgets/image_slider.dart';

class RestaurantsDetailPage extends StatelessWidget {
  const RestaurantsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: Text('Priyanka\'s Kitchen',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          backgroundColor: Colors.transparent,
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text("About",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                      "Priyanka's Kitchen is a home based kitchen that serves delicious food. We are located in the heart of the city. We serve both veg and non-veg food. We are open from 9am to 9pm. We are closed on Sundays.",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          )),
                ),
                //_getTabBar(),
                _getDeliveryWidget(),
                _getSubscribeButton(),
              ]),
        ));
  }

  Widget _getSubscribeButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Subscribe"),
    );
  }

  Widget _getDeliveryWidget() {
    return const Placeholder(
      fallbackHeight: 100,
    );
  }

  Widget _getTabBar() {
    return SizedBox(
      height: 150,
      child: TabBar(
        tabs: [
          Tab(
            text: "Menu",
          ),
          Tab(
            text: "Reviews",
          ),
          Tab(
            text: "Info",
          ),
        ],
      ),
    );
  }

  Widget _getPageView() {
    return PageView(
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
