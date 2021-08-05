import 'package:flutter/material.dart';
import 'package:dexito_play/constants/constants.dart';
import 'package:dexito_play/ui/widgets/custom_shape.dart';
import 'package:dexito_play/ui/widgets/responsive_ui.dart';
import 'package:dexito_play/ui/widgets/textformfield.dart';
import 'package:dexito_play/ui/manual_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dexito_play/ui/game_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  @override
  void initState() {
    super.initState();
    _initGoogleMobileAds();
  }

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     _width = MediaQuery.of(context).size.width;
     _pixelRatio = MediaQuery.of(context).devicePixelRatio;
     _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
     _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(

      child: Container(
        color: Color.fromARGB(255, 187,48,23,),
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              Row(
                children: <Widget>[
                  Container(
                    width: _large? _width/4 : (_medium? _width/4: _width/4),
                    child: Image.asset(
                      'assets/images/cup_left.png',
                      height: _height/5,
                      width: _width/10,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: _height / 20),
                      button_start_game(),
                      SizedBox(height: _height / 20),
                      button_manual(),
                    ],
                  ),
                  Container(
                    width: _large? _width/4 : (_medium? _width/4: _width/4),
                    child: Image.asset(
                      'assets/images/cup_right.png',
                      height: _height/5,
                      width: _width/10,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height:_large? _height/4 : (_medium? _height/3.75 : _height/3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/4.5 : (_medium? _height/4.25 : _height/4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: _large? _height/30 : (_medium? _height/25 : _height/20)),
          child: Image.asset(
            'assets/images/logo.png',
            height: _height/2.5,
            width: _width/2.5,
          ),
        ),
      ],
    );
  }

  Widget button_start_game() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {

          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => GamePage()));

      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large? _width/2 : (_medium? _width/2: _width/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.red[200], Colors.orangeAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('Start Game',style: TextStyle(fontSize: _large? 17: (_medium? 15: 13), fontFamily: "Montserrrat"),),
      ),
    );
  }
  Widget button_manual() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      onPressed: () {

        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ManualPage()));

      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large? _width/2 : (_medium? _width/2: _width/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.red[200], Colors.orangeAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('How to Play',style: TextStyle(fontSize: _large? 17: (_medium? 15: 13))),
      ),
    );
  }
}
