import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetrackerfluttercourse/app/homa_page.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sign_in_page.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          return HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}