import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dexito_play/constants/constants.dart';
import 'package:dexito_play/ui/widgets/custom_shape.dart';
import 'package:dexito_play/ui/widgets/responsive_ui.dart';
import 'package:dexito_play/ui/widgets/textformfield.dart';
import 'package:dexito_play/ui/signin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
class ManualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ManualScreen(),
    );
  }
}

class ManualScreen extends StatefulWidget {
  @override
  _ManualScreenState createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();



  List<String> manual_text = List<String>(4);

  @override
  void initState() {
    super.initState();
    manual_text[0] = "•  The aim of the game is to describe what's shown\n"+
                     "    on the screen with the minimum amount of words.";
    manual_text[1] = "•  Each word you use is an extra sip of drink you'll be\n"+
                     "    having.";
    manual_text[2] = "•  Whoever finds what's shown on the screen first, \n"
                     "    nominates someone to drink the amount of sips as\n"
                     "    the words you used.";
    manual_text[3] = "•  Once the drinks have been consumed, pass the\n" +
                     "    phone to the next person and tap the screen to\n"+
                     "    reveal the next word.";

  }

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
              SizedBox(height: _height/10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: _large? _width/7 : (_medium? _width/7: _width/7),
                    child: IconButton(
                      icon: new Icon(FontAwesomeIcons.longArrowAltLeft),
                      color: Colors.yellow,
                      iconSize: 50,
                      highlightColor: Colors.pink,
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => SignInPage()));

                      },
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      SizedBox(height: _height / 20),
                      Text('How to Play',style: TextStyle(fontSize: _large? 60: (_medium? 55: 50), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: _large? _width/5 : (_medium? _width/6: _width/6),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: _height/7,
                      width: _width/20,
                    ),
                  ),
                  Text("  "),
                ],
              ),
              SizedBox(height: _height/35,),
              Container(
                height: MediaQuery.of(context).size.height*3/5,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: _width/8,
                                ),
                                Container(
                                  width: _width*3/4,
                                  child:  Text(manual_text[0],style: TextStyle(fontSize: _large? 20: (_medium? 18: 16), fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: _width/8,
                                ),
                              ],
                            ),
                            SizedBox(height: _height/35,),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: _width/8,
                                ),
                                Container(
                                  width: _width*3/4,
                                  child:  Text(manual_text[1],style: TextStyle(fontSize: _large? 20: (_medium? 18: 16), fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: _width/8,
                                ),
                              ],
                            ),
                            SizedBox(height: _height/35,),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: _width/8,
                                  child: Image.asset(
                                    'assets/images/cup_left.png',
                                    height: _height/5,
                                    width: _width/10,
                                  ),
                                ),
                                Container(
                                  width: _width*3/4,
                                  child:  Text(manual_text[2],style: TextStyle(fontSize: _large? 20: (_medium? 18: 16), fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: _width/8,
                                  child: Image.asset(
                                    'assets/images/cup_right.png',
                                    height: _height/5,
                                    width: _width/10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: _height/35,),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: _width/8,
                                ),
                                Container(
                                  width: _width*3/4,
                                  child:  Text(manual_text[3],style: TextStyle(fontSize: _large? 20: (_medium? 18: 16), fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: _width/8,
                                ),
                              ],
                            ),
                            SizedBox(height: _height/35,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child:  Text("Simple right ?",style: TextStyle(fontSize: _large? 30: (_medium? 28: 26), fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
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
  Widget clipShape_cups() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: _large? _height*2/3 : (_medium? _height*2/3 : _height*2/3),
              left:_large? _width/10 : (_medium? _height/10 : _height/10) ),
          child: Image.asset(
            'assets/images/cup_left.png',
            height: _height/4,
            width: _width/4,
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



      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large? _width/2 : (_medium? _width/2: _width/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('Start Game',style: TextStyle(fontSize: _large? 17: (_medium? 15: 13))),
      ),
    );
  }
  Widget button_manual() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {

      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large? _width/2 : (_medium? _width/2: _width/2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('How to Play',style: TextStyle(fontSize: _large? 17: (_medium? 15: 13))),
      ),
    );
  }
}
