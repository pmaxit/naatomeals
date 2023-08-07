import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/screens/home/bloc/cusines_cubit.dart';

import '../../../data/models/menu.dart';
import 'heading.dart';

class CuisineList extends HookConsumerWidget {
  const CuisineList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const HeadingOptions(heading: "Cuisines", subHeading: "See all"),
        BlocBuilder(
          bloc: ref.read(cuisineCubitProvider)..getCuisines(),
          builder: (BuildContext context, CuisineState state) => SizedBox(
              height: 75,
              child: ListView.builder(
                itemExtent: 70,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: state.cuisines.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CuisineCard(cuisine: state.cuisines[index]));
                },
              )),
        ),
      ]),
    );
  }
}

class CuisineCard extends StatelessWidget {
  final double radius = 40;
  final double height = 60;
  final Cuisines cuisine;
  const CuisineCard({super.key, required this.cuisine});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/1.png'),
                radius: radius,
              )),
        ),
        Text(cuisine.name,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
