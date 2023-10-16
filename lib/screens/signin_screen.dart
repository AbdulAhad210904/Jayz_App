import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
import 'package:jayzapp/screens/home_page.dart';
import 'package:jayzapp/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/front.png"),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.colorBurn),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: h*0.45,),
            reusableTextField("Enter Email Address", Icons.email_outlined, false, _emailController),
            SizedBox(height: h*0.02,),
            reusableTextField("Enter Password", Icons.lock_outline, true, _passwordController),
            SizedBox(height: h*0.02,),
            SigninSignupButton(context, "Sign In", () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text)
                  .then((value) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
            SizedBox(height: h*0.02,),
            signUpOption(),

          ],
        ),
      ),
    );
  }


  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white,fontSize: 20)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
          ),
        )
      ],
    );
  }
}




