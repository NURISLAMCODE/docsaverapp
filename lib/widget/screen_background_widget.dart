import 'package:flutter/material.dart';

class ScreenBackgroundWidget extends StatelessWidget {
  const ScreenBackgroundWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.blue
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}
