import 'package:doc_saver_app/helper/sized_box_helpper.dart';
import 'package:doc_saver_app/model/file_card.dart';
import 'package:doc_saver_app/widget/custom_app_bar.dart';

import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:doc_saver_app/widget/floating_action_button.dart';
import 'package:doc_saver_app/widget/screen_background_widget.dart';
import 'package:flutter/material.dart';

import '../widget/file_card.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomfloatingActionButton(
        title: "Add Pdf",
        iconData: Icons.add,
        onPress: () {},
      ),
      appBar: const CustomAppBar(),
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   actions: [
      //     Consumer<AuthProvider>(builder: (context, provider, child) {
      //       return provider.isLogOut
      //           ? const Center(
      //               child: CircularProgressIndicator(),
      //             )
      //           : IconButton(
      //               onPressed: () {
      //                 provider.logOut(context);
      //               },
      //               icon: Icon(Icons.logout),
      //             );
      //     }),
      //   ],
      // ),
      body: ScreenBackgroundWidget(
        child: ListView(
          children: [
            FileCardWidget(
              model: FileCardModel(
                  title: "this is title",
                  subTitle: "this is subtiuttle",
                  dateAdded: "12-08-24",
                  fileType: "pdf"),
            ),
          ],
        ),
      ),
    );
  }
}
