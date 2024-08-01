import 'package:flutter/material.dart';

class CustomfloatingActionButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPress;
  const CustomfloatingActionButton(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(iconData),
            Center(
                child: Text(
              "${title}",
              style: const TextStyle(
                color: Colors.black,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
