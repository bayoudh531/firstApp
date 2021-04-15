

import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/phoneAuth/phoneAuthCubit.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetInitialProfilPage extends StatefulWidget {

  final String phoneNumber;

  const SetInitialProfilPage({Key key, this.phoneNumber}) : super(key: key);
  @override
  _SetInitialProfilPage createState()=> _SetInitialProfilPage();
   
  
}

class _SetInitialProfilPage extends State<SetInitialProfilPage> {
  TextEditingController _nameController=TextEditingController();
  String get phoneNumber => widget.phoneNumber;
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
       Text("Profil Info",
       textAlign: TextAlign.center,
       style: TextStyle(
         fontSize: 20,
        color: lightPrimaryColor,
        fontWeight: FontWeight.w900
       ),
       ),
  ],
),
 
 SizedBox(height: 30,),
      Text("Please provide your name and an optional Profil photo",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16,
      ),
      ),

SizedBox(
height: 30,
),
  _roWidget(),
  Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child:MaterialButton(
      color:  greenColor,
      onPressed: (){
       submitProfileInfo();
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

  Widget _roWidget() {
    return Container(
child: Row(
  children:<Widget>[
    Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: textIconColorGray,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(25))
      ),
    child: Icon(Icons.camera_alt),
    ),
  SizedBox(
width: 8,
  ),
  Expanded(
    child: TextField(
      controller: _nameController,
      decoration: InputDecoration(
        hintText: "Enter your name "
      ),
    )
  ),
  SizedBox(
width: 8.0,
  ),
  Container(
width: 35,
height: 35,
decoration: BoxDecoration(
  color: textIconColorGray,
  borderRadius: BorderRadius.all(Radius.circular(25))
),
  child: Icon(Icons.insert_emoticon),
  ),
  ],
),
    );
  }
  void submitProfileInfo() {
    if (_nameController.text.isNotEmpty) {
      BlocProvider.of<PhoneAuthCubit>(context).submitProfileInfo(
          profileUrl: "",
          phoneNumber: phoneNumber,
          name: _nameController.text);
    }
  }
@override
  void dispose() {
    _nameController.dispose();
      super.dispose();
    }

}