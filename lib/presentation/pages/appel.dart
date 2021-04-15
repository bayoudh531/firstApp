import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/subPages/singleItemCallPage.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';

class Apelle extends StatelessWidget {
  // This widget is the root of your application.
@override
  Widget build(BuildContext context){

return Scaffold(
  body:ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleItemCallPage();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: primaryColor,
        child: Icon(Icons.add_call,color: Colors.white,),
      ),
);

}
}