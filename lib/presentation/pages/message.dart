import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/subPages/singleItemChatPageUser.dart';

class Message extends StatelessWidget {
  // This widget is the root of your application.
@override
  Widget build(BuildContext context){

return Scaffold(
  body: Column(
children: <Widget>[
  Expanded(
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (_,index){return SingleItemChatUserPage();
      },
      )
    )
],
  ),

  );


}
}