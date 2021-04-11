import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';

class CustomTabBar extends StatelessWidget {
  // This widget is the root of your application.
@override
  Widget build(BuildContext context){

return Container(
height: 50,
decoration: BoxDecoration(color: primaryColor),
child: Row(
  children: <Widget>[
    Container(
width: 40,
child: Icon(Icons.camera_alt,color: Colors.white,),
    ),
    Expanded(
      child: CustomTabBarButton(
        text: "CHATS",
        textColor: Colors.white,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
      ),
    ),
  Expanded(
      child: CustomTabBarButton(
        text: "STATUS",
        textColor: Colors.white,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
      ),
    ),
  Expanded(
      child: CustomTabBarButton(
        text: "CALLS",
        textColor: Colors.white,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
      ),
    ),
  
  ],
),
);
}
}

class CustomTabBarButton extends StatelessWidget {
  // This widget is the root of your application.
  final String text;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;

  const CustomTabBarButton({Key key,this.borderColor,this.borderWidth,this.text,this.textColor});

@override
  Widget build(BuildContext context){
return Container(
alignment: Alignment.center,
decoration: BoxDecoration(
  border: Border(bottom: BorderSide(color:borderColor,width: borderWidth),
  ),
),
child: Text(text,
style:TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: textColor,
),
),
);
}
}
