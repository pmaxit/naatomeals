import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const AppButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Container Widget...
        ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20),
            child: Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(3, 3),
                      )
                    ],
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF1C038),
                        Color(0xFFF0B036),
                        Color(0xFFEC7B31),
                        Color(0xFFE9512D),
                        Color(0xFFE7332A),
                        Color(0xFFE52128),
                        Color(0xFFE51A27)
                      ],
                      stops: [0.11, 0.16, 0.33, 0.49, 0.64, 0.76, 0.85],
                      begin: AlignmentDirectional(-1, 0.64),
                      end: AlignmentDirectional(1, -0.64),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                return TextButton(
                  onPressed: onTap,
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(24),
                      minimumSize: Size(constraints.maxWidth, 60)),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          // google fonts
                        ),
                  ),
                );
              }),
            ]));
  }
}
