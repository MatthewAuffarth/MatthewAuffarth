import 'package:app1/components/square_tile.dart';
import 'package:app1/components/textfield.dart';
import 'package:app1/components/button.dart';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//text editing controllers
final emailController = TextEditingController();
final passwordController = TextEditingController();

void invalidCredentialsMessage() {
  showDialog(context: context, 
    builder: (context) {
      return const AlertDialog(
        title: Text('Please enter valid credentials'),
      );
    },
  );
}


// sign user in method
void signUserIn() async {
  // loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
  );

  //attempt sign in
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text);
    //pop loading circle
    Navigator.pop(context);
  } 
  

  on FirebaseAuthException {
     //pop loading circle
     Navigator.pop(context);
     invalidCredentialsMessage();
  }  
} //sign user in, end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(240, 239, 238, 238),
      body: SafeArea(
        child: Center(
          child: Column
          (children: [
            const SizedBox(height: 50),
            //logo
            const Icon(Icons.lock,size: 100,),
            
            //welcome 
            const Text(
              'Welcome back.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16 
              )
            ),
      
            const SizedBox(height: 130),

            //username textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false
            ),

            const SizedBox(height: 10),
            
            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true
            ),
            
            const SizedBox(height: 20),
            //forgot password?
            const Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
                Text('Forgot Password?',
                style: TextStyle(color: Colors.black),
                ),
              ] ,
            ),
          ),

          const SizedBox(height: 20),

          //sign in button
          MyButton(onTap: signUserIn,),
          
          const SizedBox(height: 20),

          //or sign in with
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:10.0),
                  child: Text(
                    'Or sign in with',
                    style: TextStyle(color: Colors.black)
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: .5,
                    color: Colors.grey
                    ),
                  ), 
              ],
            ),
          ),

          const SizedBox(height: 20),  
          //Logos for Apple and Google sign in
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
       

              SquareTile(imagePath: '/Users/matthewauffarth/dev/app1/lib/images/apple.png',size: 40),
              SizedBox(width:20),
              SquareTile(imagePath: '/Users/matthewauffarth/dev/app1/lib/images/google.png', size: 40),         

            ],

          ), 
          const SizedBox(height: 20),

          //not a member? register now
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member? '),
              
              Text(
                'Register now',
                style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
              )

              
            ],

          ),




            ], // end login page children widgets
          )
        ),
      ),
    );
  }
}