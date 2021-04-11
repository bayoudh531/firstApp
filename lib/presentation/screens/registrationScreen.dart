
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/presentation/pages/phoneVarificationPage.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';

class RegisterScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _RegistrationScreenState createState()=>_RegistrationScreenState();
  
  }
 class _RegistrationScreenState extends State<RegisterScreen> { 

@override
  Widget build(BuildContext context){

return Scaffold(
body: Container(
  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
   child: Column(
   children:<Widget>[
     SizedBox(
height: 20,
     ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget> [
        SizedBox(
          height: 10,
        ),
       Text(""),
       Text("Verify your number",style: TextStyle(
         fontSize: 20,
        color: lightPrimaryColor,
        fontWeight: FontWeight.w900
       ),
       ),
       Icon(Icons.more_vert)
          ],
        ),
      SizedBox(height: 30,),
      Text("WhatsApp will send and SMS message (carrier changes may apply) to verify your phone number.Enter your country code and phone number",
      style: TextStyle(fontSize: 16,),
      ),
SizedBox(height: 30,
),
Row(
  children: <Widget>[
    Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.50,color: textIconColor,))
      ),
     width: 80,
     height: 42,
     alignment: Alignment.center,
      child: CountryCodePicker(
  onChanged: print,
  initialSelection: 'IT',
  favorite: ['+39','FR'],
  showCountryOnly: false,
  showOnlyCountryWhenClosed: false,
  alignLeft: false,
),      
    ),
  SizedBox(
width: 8.0,
  ),
  Expanded(
    child: Container(
    height: 40,
    child: TextField(
      decoration: InputDecoration(
        hintText: "Phone Number"
      ),
    ),
  ),
  ),
  
  ],

),
Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child:MaterialButton(
      color:  greenColor,
      onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder:(_)=>PhoneVerifierPage()));
      },
      child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),
      ),
    ) 

    ),
    
  )
   
      ],
    ),
  ),
);
  
 
  }
  }
  