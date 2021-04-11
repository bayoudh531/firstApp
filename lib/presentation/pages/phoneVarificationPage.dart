
import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/setInitialProfilePage.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerifierPage extends StatefulWidget {
  @override
  _PhoneVerifierPage createState()=>_PhoneVerifierPage();
  
}

class _PhoneVerifierPage extends State<PhoneVerifierPage>{
  TextEditingController _pinCodeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
  body: Container(
  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),  
 child: Column( 
  children: <Widget>[
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

_pinCodeWidget(),

Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child:MaterialButton(
      color:  greenColor,
      onPressed: (){
       Navigator.push(context,MaterialPageRoute(builder:(_)=>SetInitialProfilPage())); 
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

  Widget _pinCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50,),
child: Column(
  children: <Widget>[
    PinCodeTextField(
    controller: _pinCodeController,
    length: 6,
    backgroundColor: Colors.transparent,
  obsecureText: true,
    onChanged: (pinCode){
      print(pinCode);
    }
  
  ),
  Text("Enter 6 digit code")
  ],
  
),
    );
  }
@override
  void dispose() {
      _pinCodeController.dispose();
      super.dispose();
    }


}
