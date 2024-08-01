import 'package:doc_saver_app/helper/sized_box_helpper.dart';
import 'package:doc_saver_app/provider/auth_provider.dart';
import 'package:doc_saver_app/screen/porgot_password_screen.dart';
import 'package:doc_saver_app/widget/custom_button.dart';
import 'package:doc_saver_app/widget/custom_text_field.dart';
import 'package:doc_saver_app/widget/screen_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = "/authScreen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController userNameController = TextEditingController(text: "nur");
  TextEditingController emailController =
      TextEditingController(text: "nur@gmail.com");
  TextEditingController passController =
      TextEditingController(text: "123456789");
  TextEditingController conPassController =
      TextEditingController(text: "123456789");
  bool supIxIcon = true;
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return Scaffold(
        body: ScreenBackgroundWidget(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/doc.png",
                      height: 150,
                    ),
                    SizedBoxHelpper.sizedBox20,
                    if (!provider.isLogin)
                      CustomTextField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter your User name";
                          } else {
                            return null;
                          }
                        },
                        controller: userNameController,
                        hintText: "User Name",
                        labelText: "Enter User name",
                        preFixIcon: Icons.person,
                      ),
                    SizedBoxHelpper.sizedBox20,
                    CustomTextField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter your valid email";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      hintText: "User Emai",
                      labelText: "Enter User Email",
                      preFixIcon: Icons.email,
                    ),
                    SizedBoxHelpper.sizedBox20,
                    CustomTextField(
                        controller: passController,
                        obsucure: provider.isTroggole,
                        validator: (String? value) {
                          if (value!.isEmpty || value.length <= 8) {
                            return "Enter Your valid password";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Password",
                        labelText: "Your Password",
                        preFixIcon: Icons.password_rounded,
                        sufixIcon: IconButton(
                          onPressed: () {
                            provider.setTroggole();
                          },
                          icon: Icon(
                            provider.isTroggole
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                          ),
                        )),
                    SizedBoxHelpper.sizedBox20,
                    if (!provider.isLogin)
                      CustomTextField(
                          controller: conPassController,
                          obsucure: provider.isTroggole,
                          validator: (String? value) {
                            if (value!.isEmpty || value.length <= 8) {
                              return "Enter Your Confrim password";
                            } else if (value != passController.text) {
                              return "Dosen't macth your password";
                            } else {
                              return null;
                            }
                          },
                          hintText: "Confrim Password",
                          labelText: "Your Confirm Password",
                          preFixIcon: Icons.password_rounded,
                          sufixIcon: InkWell(
                            onTap: () {
                              provider.setTroggole();
                            },
                            child: Icon(
                              provider.isTroggole
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off,
                            ),
                          )),
                    SizedBoxHelpper.sizedBox20,
                    provider.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            color: provider.isLogin
                                ? Colors.blue
                                : Colors.blue.shade800,
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                print("Evreything fine");
                                if (provider.isLogin == true) {
                                  provider.signIn(
                                      email: emailController.text,
                                      password: passController.text,
                                      context);
                                } else {
                                  provider.signUp(
                                      email: emailController.text,
                                      password: passController.text,
                                      context);
                                }
                              }
                              ;
                            },
                            title: provider.isLogin ? "Login" : "Registration",
                          ),
                    SizedBoxHelpper.sizedBox20,
                    MaterialButton(
                      onPressed: () {
                        provider.setState();
                      },
                      child: Text(
                        provider.isLogin
                            ? "Don't have an Account? register"
                            : "Allready have an account ? login",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBoxHelpper.sizedBox40,
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgotPasswordScreen.routeName);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
