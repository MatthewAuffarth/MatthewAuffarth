import 'package:app1/components/square_tile.dart';
import 'package:app1/components/textfield.dart';
import 'package:app1/components/button.dart';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

//text editing controllers
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();

void showErrorMessage(String error) {
  showDialog(context: context, 
    builder: (context) {
      return AlertDialog(
        title: Text(error),
      );
    },
  );
}


// sign user up method
void signUserUp() async {
  // loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
  );

  //try creating the user
  try {
    if(passwordController.text == confirmPasswordController.text)
    {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text);
    // pop loading circle
       Navigator.pop(context);
    }
    else 
    {
      Navigator.pop(context);
      //  error message passwords dont match
      showErrorMessage("Passwords don't match");
    }

    
    
  } 
  

  on FirebaseAuthException {
     //pop loading circle
     Navigator.pop(context);
     
  }  
} //sign user in, end

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:const Color.fromARGB(240, 239, 238, 238),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column
            (children: [
              const SizedBox(height: 50),
              //logo
              const Icon(Icons.lock,size: 100,),
              
              //welcome text
              const Text(
                'Create a login.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16 
                )
              ),
                  
              const SizedBox(height: 70),
            
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
              
              const SizedBox(height: 10),
              
              //confirm password
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true
              ),
            
              //forgot password?
              
            
            const SizedBox(height: 20),
            
            //sign up button
            MyButton(
              text:"Sign Up",
              onTap: signUserUp,),
            
            const SizedBox(height: 20),
            
            //or sign up with
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
                      'Or sign up with',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member? '),
                
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login now',
                    style: TextStyle(color: Colors.blueAccent, 
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            
                
              ],
            
            ),
            
            
            
            
              ], // end login page children widgets
            ),
          )
        ),
      ),
    );
  }
}