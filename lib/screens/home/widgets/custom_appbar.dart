import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final double maxHeight;
  final double minHeight;

  const AppHeader({Key? key, required this.maxHeight, required this.minHeight})
      : super(key: key);

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Align _buildTitle(Animation<double> animation) {
    return Align(
      alignment:
          AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.bottomLeft)
              .evaluate(animation),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Deliver To\n123 Main St Dallas Tx",
              // medium style
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: Tween<double>(begin: 5, end: 14).evaluate(animation),
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(Animation<double> animation) {
    return Align(
      alignment:
          AlignmentTween(begin: Alignment.topRight, end: Alignment.centerRight)
              .evaluate(animation),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, top: 0),
        child: Opacity(
          opacity: Tween<double>(begin: 0, end: 1).evaluate(animation),
          child: CircleAvatar(
            radius: Tween<double>(begin: 10, end: 30).evaluate(animation),
            backgroundImage: NetworkImage(
                'https://restaurant-api.dicoding.dev/images/medium/14'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final expandRatio = _calculateExpandRatio(constraints);
      final animation = AlwaysStoppedAnimation(expandRatio);

      return Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),
        // add circle avatar
        _buildAvatar(animation),

        _buildTitle(animation),
        // add text box here to search for restaurant
        _buildSearchBar(constraints),
      ]);
    });
  }

  Widget _buildSearchBar(BoxConstraints constraints) {
    return Positioned(
      top: constraints.maxHeight - 30,
      left: 16,
      right: 16,
      child: Opacity(
        opacity: 1,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
