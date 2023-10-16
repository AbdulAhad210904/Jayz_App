import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/reusables_widgets/reusable_widgets.dart';
import 'package:jayzapp/screens/home_page.dart';
import 'package:jayzapp/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _userController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("SignUp",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white70),),
      ),
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
            SizedBox(height: h*0.3,),
            reusableTextField("Enter User Name", Icons.person_outlined, false, _userController),
            SizedBox(height: h*0.02,),
            reusableTextField("Enter Email", Icons.email_outlined, false, _emailController),
            SizedBox(height: h*0.02,),
            reusableTextField("Enter Password", Icons.lock_outline, true, _passwordController),
            SizedBox(height: h*0.05,),
            SigninSignupButton(context, "Sign Up", () {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text)
                  .then((value) {
                print("Created New Account");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });
            }),
          ],
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen()));
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
