import 'package:flutter/material.dart';
import 'package:jayzapp/widgets/AppBarWidget.dart';

import '../widgets/DrawerWidget.dart';

class AboutUs extends StatefulWidget {
   AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(),
          Center(
            child: Column(
              children: const [
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Our Tremendous Journey',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: AssetImage('images/jayz.png'),
                    backgroundColor: Colors.grey,
                  ),
                ),

                //Image.asset('images/jayz.png'),
                Padding(
                  padding:  EdgeInsets.all(28.0),
                  child: Text(
                    'Jayz Fast Food App is a food delivery service that allows you to order food and have it delivered to your doorstep in no time. We are a one-stop solution for all your food cravings. We are currently operating in Karachi, Lahore, Islamabad, Rawalpindi, Multan, Peshawar, Faisalabad, Hyderabad, and Gujranwala. We are expanding our services to other cities very soon.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
