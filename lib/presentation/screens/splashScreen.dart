import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  
  @override
  SplashScreenState createState()=> SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // This widget is the root of your application.
  @override
  String initState(){
    String x=("the object is inserted into the three");
    Timer(Duration(seconds:3),(){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder:(_)=>WelcomeScreen(),
    ), (route) => false,);
    }
    );
  super.initState();
  return x; 
  } 
  
  @override
  Widget build(BuildContext context){
return Scaffold(
  backgroundColor: Colors.black,
  body: Center(
    child: Text("WhatsApp",style:TextStyle(fontSize: 40,
    color: Colors.white),
  ),

),
);
  }
}