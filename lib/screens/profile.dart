import 'package:firebase_auth/firebase_auth.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/widgets/DrawerWidget.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          AppBarWidget(),
          SizedBox(height: 50),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("images/avatar.jpg"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: TextStyle(color: Colors.black.withOpacity(0.9),
                      fontSize: 18,),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
