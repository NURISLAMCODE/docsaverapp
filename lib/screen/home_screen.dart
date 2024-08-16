import 'package:doc_saver_app/helper/sized_box_helpper.dart';
import 'package:doc_saver_app/model/file_card.dart';
import 'package:doc_saver_app/screen/add_document_screen.dart';
import 'package:doc_saver_app/widget/custom_app_bar.dart';

import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:doc_saver_app/widget/floating_action_button.dart';
import 'package:doc_saver_app/widget/screen_background_widget.dart';
import 'package:firebase_database/firebase_database.dart';
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
        onPress: () {
          Navigator.pushNamed(context, AddDocumentScreen.routeName);
        },
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
        child: StreamBuilder<DatabaseEvent>(
          stream: FirebaseDatabase.instance.ref().child("files_info").onValue,
          builder: (context, snapshot ) {
            if(snapshot.hasData && snapshot.data!.snapshot.value != null){
              print(snapshot.data!.snapshot.value);
              List<FileCardModel>  _list = [];
              (snapshot.data!.snapshot.value as Map<dynamic, dynamic>).forEach((key, value){
                print(key);
                print(value);
                _list.add(FileCardModel.fromJson(value));
              });
              return ListView(
                children: _list.map((toElement)=>
                    FileCardWidget(
                      model: FileCardModel(
                          title: toElement.title,
                          subTitle: toElement.subTitle,
                          dateAdded: toElement.dateAdded,
                          fileType: toElement.fileType,
                          fileUrl: toElement.fileUrl,
                          fileName: toElement.fileName
                      ),
                    )
                ).toList(),
              );
            }else{
              return Text("No Data");
            }

            }
        ),
      ),
    );
  }
}
