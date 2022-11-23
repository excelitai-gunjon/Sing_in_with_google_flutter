import 'package:authentication_google/constant/app_decoration.dart';
import 'package:authentication_google/screen/home_screen.dart';
import 'package:authentication_google/service/google_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome Back',style: myStyle(28, Colors.black),),

            const SizedBox(height: 20,),

             MaterialButton(
               color: Colors.green,
               height: 50,
               child: Text('Login with Google',style: myStyle(20, Colors.black),),
               onPressed: () async {
              await FirebaseServices().signInWithGoogle();
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },

            )
          ],
        ),
      ),
    );
  }
}
