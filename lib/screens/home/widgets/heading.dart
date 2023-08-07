import 'package:flutter/material.dart';

class HeadingOptions extends StatelessWidget {
  final String heading;
  final String subHeading;
  const HeadingOptions(
      {super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(heading,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
          SizedBox(
            height: 30,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  subHeading,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                )),
          )
        ],
      ),
    );
  }
}
