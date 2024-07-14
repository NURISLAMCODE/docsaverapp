import 'package:doc_saver_app/helper/sized_box_helpper.dart';
import 'package:doc_saver_app/provider/auth_provider.dart';
import 'package:doc_saver_app/widget/custom_button.dart';
import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:doc_saver_app/widget/screen_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static final routeName = "/forgotPassword";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroundWidget(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/doc.png",
                height: 150,
              ),
              const Text(
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Fill Your Email";
                    }
                    return null;
                  }),
              SizedBoxHelpper.sizedBox20,
              Consumer<AuthProvider>(builder: (context, authProvider, child) {
                return authProvider.forgotPassLoad
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            authProvider.forgotPassword(
                                context, emailController.text);
                          }
                        },
                        title: "Forgot Password");
              })
            ],
          ),
        ),
      ),
    );
  }
}
