import 'package:doc_saver_app/helper/sized_box_helpper.dart';
import 'package:doc_saver_app/widget/custom_button.dart';
import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:doc_saver_app/widget/screen_background_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static final routeName = "/forgotPassword";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroundWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/doc.png",
              height: 150,
            ),
            Text(
              "Enter Email to Reset Password",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBoxHelpper.sizedBox20,
            CustomTextField(
                controller: emailController,
                hintText: "Enter Email",
                labelText: "Enter Email",
                preFixIcon: Icons.email,
                sufixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Fill Your Email";
                  }
                  return null;
                }),
            SizedBoxHelpper.sizedBox20,
            CustomButton(onPressed: () {}, title: "Forgot Password")
          ],
        ),
      ),
    );
  }
}
