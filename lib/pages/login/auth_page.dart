
//PAGES
import 'package:app1/pages/login/login_or_register_page.dart';
import 'package:app1/pages/reader.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if(snapshot.hasData){
            return const HomePage();
          }
          //user not logged in
          else {
            return const LoginOrRegisterPage();
          }
        }
      )
    );
  }


}