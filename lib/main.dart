import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/auth/authCubit.dart';
import 'package:flutter_application_2/presentation/bloc/auth/authState.dart';
import 'package:flutter_application_2/presentation/bloc/phoneAuth/phoneAuthCubit.dart';
import 'package:flutter_application_2/presentation/widgets/theme/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injectionContainer.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'presentation/screens/WelcomeScreen.dart';
import 'presentation/screens/homeScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
       ),
        BlocProvider(
          create: (_) => di.sl<PhoneAuthCubit>(),
        ),
    ],
   child :MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primaryColor: primaryColor,
      ),
     routes: {
      "/": (context) {
      return BlocBuilder<AuthCubit, AuthState>(
       builder: (context, authState) {
      if (authState is Authenticated) {
      return HomeScreen(uid:authState.uid);
      }
     if (authState is UnAuthenticated) {
       return WelcomeScreen();
        }
      return Container();
        },
        );
      }
        },
      
    ),
   
    );
    
    
  }
}

