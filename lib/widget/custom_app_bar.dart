import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../helper/sized_box_helpper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        color: const Color(0xff1e5373),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBoxHelpper.sizedBox20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/doc.png",
                    height: 50,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBoxHelpper.sizedBox20,
              CustomTextField(
                controller: TextEditingController(),
                hintText: "Enter the title doc",
                preFixIcon: Icons.search,
                sufixIcon: IconButton(
                  icon: const Text("GO"),
                  onPressed: () {},
                ),
                validator: (value) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
