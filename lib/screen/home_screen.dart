import 'package:doc_saver_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Consumer<AuthProvider>(builder: (context, provider, child) {
            return provider.isLogOut
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : IconButton(
                    onPressed: () {
                      provider.logOut(context);
                    },
                    icon: Icon(Icons.logout),
                  );
          }),
        ],
      ),
    );
  }
}
