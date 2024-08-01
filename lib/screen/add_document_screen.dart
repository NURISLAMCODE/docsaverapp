import 'package:doc_saver_app/helper/sized_box_helpper.dart';
import 'package:doc_saver_app/provider/document_provider.dart';
import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:doc_saver_app/widget/floating_action_button.dart';
import 'package:doc_saver_app/widget/screen_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDocumentScreen extends StatelessWidget {
  static String routeName = "/addDocumentScreen";
  const AddDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    return Scaffold(
      floatingActionButton: CustomfloatingActionButton(
        iconData: Icons.fork_right,
        onPress: () {},
        title: "Upload",
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff1e5373),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: const Center(
          child: Text(
            "Add Document",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ScreenBackgroundWidget(
        child: Consumer<DocumentProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              CustomTextField(
                controller: titleController,
                hintText: "title",
                preFixIcon: Icons.title,
                labelText: "Please Enter The Title",
                obsucure: false,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your title";
                  }
                  return null;
                },
              ),
              SizedBoxHelpper.sizedBox20,
              CustomTextField(
                controller: noteController,
                hintText: "title",
                preFixIcon: Icons.note,
                labelText: "Please Enter The Note",
                obsucure: false,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter Your note";
                  }
                  return null;
                },
              ),
              SizedBoxHelpper.sizedBox20,
              InkWell(
                onTap: () {
                  provider.getFile();
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2),
                  ),
                  child: Column(
                    children: [
                      SizedBoxHelpper.sizedBox40,
                      const Text("FileName"),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 30,
                          ),
                          Text(
                            "Upload File",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
