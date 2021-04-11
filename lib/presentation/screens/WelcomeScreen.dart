import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/screens/registrationScreen.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';


class WelcomeScreen extends StatelessWidget {
  // This widget is the root of your application.
@override
  Widget build(BuildContext context){

return Scaffold(
body: Container(
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0XFFFFCCBC).withOpacity(0.1),
      Color(0XFFFB8C00).withOpacity(0.7)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
    )
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:<Widget> [
      SizedBox(
height: 60,
      ),
Text("Welcome to Whatshapp",style: TextStyle(fontSize: 50,color: primaryColor,
fontWeight: FontWeight.bold,
),
textAlign: TextAlign.center,),
   SizedBox(
height: 4,
   ),
   Container(
     height: 290,
     width: 290,
     child: Image.asset("assets/photo1.jpg"),
   ) ,   
  SizedBox(
height: 4,
  ),
   Column(
children:<Widget> [
  Text("Read our Privacy Policy Tap,'Agree and continue' to accept the terms of service",
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 14),
  ),

SizedBox(
height: 5,
),
MaterialButton(
  color: greenColor,
  onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder:(_)=>RegisterScreen(),
    ),
    );
  },
  child: Text("AGREE AND CONTINUE",style: TextStyle(fontSize: 18,color: Colors.white),
  ), 
),

],
   ) 
    
    ],
  ),
),
);
  }
}