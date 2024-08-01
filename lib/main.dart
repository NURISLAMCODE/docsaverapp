import 'package:doc_saver_app/provider/auth_provider.dart';
import 'package:doc_saver_app/provider/document_provider.dart';
import 'package:doc_saver_app/screen/add_document_screen.dart';
import 'package:doc_saver_app/screen/authentication_screen.dart';
import 'package:doc_saver_app/screen/home_screen.dart';
import 'package:doc_saver_app/screen/porgot_password_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DocumentProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AuthScreen.routeName,
        routes: {
          AuthScreen.routeName: (context) => const AuthScreen(),
          ForgotPasswordScreen.routeName: (contex) =>
              const ForgotPasswordScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          AddDocumentScreen.routeName: (context) => const AddDocumentScreen(),
        },
        home: const AuthScreen(),
      ),
    );
  }
}
