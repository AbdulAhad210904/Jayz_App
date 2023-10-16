import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jayzapp/screens/AllCategories.dart';
import 'package:jayzapp/screens/AllPopular.dart';
import 'package:jayzapp/screens/CartPage.dart';
import 'package:jayzapp/screens/SplashScreen.dart';
import 'package:jayzapp/screens/AboutUs.dart';
import 'package:jayzapp/screens/cart.dart';
import 'package:jayzapp/screens/home_page.dart';
import 'package:jayzapp/screens/home_screen.dart';
import 'package:jayzapp/screens/profile.dart';
import 'package:jayzapp/screens/signin_screen.dart';
import 'package:jayzapp/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChannels.platform.invokeMethod('setFirebaseLocale', 'en-US');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //populateCartItems();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F3),
      ),
      home: SplashScreen(),
      routes: {
        //"/": (context) => HomePage(),
        "aboutus": (context) => AboutUs(),
        "cartpage": (context) => CartScreen(),
        "profile": (context) => Profile(),
        "categories": (context) => AllCategories(),
        "popular": (context) => AllPopular(),
      },
      //home: Home(),
    );
  }
}

