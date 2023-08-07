import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Theme.of(context).shadowColor,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What are you carving for?',
          prefixIcon: Icon(Icons.search, color: orangeColor),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
