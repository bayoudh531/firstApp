
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/presentation/bloc/auth/authCubit.dart';
import 'package:flutter_application_2/presentation/bloc/auth/authState.dart';
import 'package:flutter_application_2/presentation/bloc/phoneAuth/phoneAuthCubit.dart';
import 'package:flutter_application_2/presentation/bloc/phoneAuth/phoneAuthState.dart';
import 'package:flutter_application_2/presentation/pages/phoneVarificationPage.dart';
import 'package:flutter_application_2/presentation/pages/setInitialProfilePage.dart';
import 'package:flutter_application_2/presentation/screens/homeScreen.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _RegistrationScreenState createState()=>_RegistrationScreenState();

}
class _RegistrationScreenState extends State<RegisterScreen> {

  TextEditingController _phoneAuthController = TextEditingController();
  String phoneNumber="";

  String countryCode = "";

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
          listener: (context, phoneAuthState) {
            if (phoneAuthState is PhoneAuthSuccess) {
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if (phoneAuthState is PhoneAuthFailure){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Something is wrong"),
                      Icon(Icons.error_outline)
                    ],
                  ),
                ),
              ));
            }
          },

          // ignore: missing_return
          builder: (context, phoneAuthState) {
            if (phoneAuthState is PhoneAuthSmsCodeReceived) {
              return PhoneVerifierPage(
                phoneNumber: phoneNumber,
              );

            }
            if (phoneAuthState is PhoneAuthProfileInfo) {
              return SetInitialProfilPage(
                phoneNumber: phoneNumber,
              );
            }
            if (phoneAuthState is PhoneAuthLoading) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            }
            if (phoneAuthState is PhoneAuthSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return HomeScreen(uid: authState.uid,);
                  }
                  return Container();


                },


              );
            }
            return bodyWidget();
          }
      ),
    );
  }
  Widget bodyWidget() {
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
                    onChanged: (code) {
                      countryCode = code.dialCode;
                      ////print(code.dialCode);
                    },
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
                      submitVerifyPhoneNumber();
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
  void submitVerifyPhoneNumber() {
    if (_phoneAuthController.text.isNotEmpty && countryCode.isNotEmpty) {
      phoneNumber="${_phoneAuthController.text}";
      BlocProvider.of<PhoneAuthCubit>(context).submitVerifyPhoneNumber(
        phoneNumber:countryCode  +phoneNumber,
      );
    }
  }
}







