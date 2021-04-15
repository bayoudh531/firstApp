import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/pages/appel.dart';
import 'package:flutter_application_2/presentation/pages/message.dart';
import 'package:flutter_application_2/presentation/pages/statusPage.dart';
import 'package:flutter_application_2/presentation/widgets/customTabBar.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
   final String uid;

  const HomeScreen({Key key, this.uid}) : super(key: key);
  
  @override
  _HomeScreen createState()=>_HomeScreen();
  
}

class _HomeScreen extends State<HomeScreen>{

  bool _isSearch=false;
   int indexPages=1;
  PageController _pageviewController=PageController(initialPage:1);
  List<Widget> _pages= [
  
  Message(),
  StatusPage(),
  Apelle(),
  ];
  _buildSearch(){
    return Container(
height: 45,
margin: EdgeInsetsDirectional.only(top: 25),
decoration: BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(.3),
      spreadRadius: 1,
      offset: Offset(0.0, 0.50)
    )
  ]
),
    child:TextField(
      decoration: InputDecoration(
        hintText: "Search ....",
        prefixIcon: InkWell(onTap: (){
     setState(() {
            _isSearch=false;
          });
        },
        child: Icon(Icons.arrow_back),
        ),
      ),
    ),
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  elevation: 0.0,
  automaticallyImplyLeading: false,
  backgroundColor: _isSearch==false?primaryColor:Colors.transparent,
  title:_isSearch==false? Text("WhatsApp"):Container(height: 0.0,width: 0.0,),
  flexibleSpace: _isSearch==false?Container(height: 0.0,width: 0.0,)
  :_buildSearch(),
  actions:<Widget> [
    InkWell(
    onTap: (){
      setState(() {
              _isSearch=true;
            });
    },
    child : Icon(Icons.search)
    ),
    SizedBox(
width: 5,
    ),
    Icon(Icons.more_vert)
  ],
),
    body: Column(
      children:<Widget> [
CustomTabBar(),
Expanded(
  child:PageView.builder(
    itemCount: _pages.length,
    controller: _pageviewController,
    onPageChanged: (index){
      setState(() {
             indexPages=index; 
            });
    },
    itemBuilder: (_,index){
return _pages[index];
    },
    )
  )
      ],
    ),
    
    
    
    );
  }

}


