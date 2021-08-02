import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dexito_play/constants/constants.dart';
import 'package:dexito_play/ui/signin.dart';
import 'package:dexito_play/ui/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Main Screen",
      theme: ThemeData(primaryColor: Colors.orange[200]),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        SIGN_IN: (BuildContext context) =>  SignInPage(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}

