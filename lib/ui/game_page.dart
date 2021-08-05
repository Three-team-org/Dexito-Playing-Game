import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dexito_play/constants/constants.dart';
import 'package:dexito_play/ui/widgets/custom_shape.dart';
import 'package:dexito_play/ui/widgets/responsive_ui.dart';
import 'package:dexito_play/ui/widgets/textformfield.dart';
import 'package:dexito_play/ui/signin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:dexito_play/ui/widgets/ad_helper.dart';
class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  List<String> manual_text = List<String>(4);


  List<String> word_list = [
    "spoon", "cup", "duck","floor", "quilt", "pen", "necklace", "mop", "chili", "watch", "rock", "whipped-cream", "egg", "rabbit", "wallet", "face",
    "sandglass", "pepper ", "bracelet", "marble", "lamp", "coffee", "mug", "toy", "boat", "carrots", "CD", "knife", "football", "mousepad", "dagger", "snow", "soldier", "ice-cream", "pin",
    "clock", "battery", "brush", "screw", "scissors", "hammer", "chalk", "pot", "book", "hamster", "cement", "key", "lion", "candlestick", "chocolate", "bottle", "laser ",
    "television", "toilet ", "paper", "plate", "baseball", "umbrella", "glass", "toothpick", "hair", "dove", "soda", "car", "honey", "banana", "flashlight", "orange",
    "needle", "thermometer", "dominos", "shark", "octopus", "tiger", "magazine", "trucks", "twister", "fork", "toothbrush", "pickles", "dinosaur", "remote",
    "rat", "belt", "chain", "lime", "puzzle", "milk", "note", "bookmark", "dolphin", "bag", "corn", "washcloth", "food", "book", "scarf",
    "panda", "toothpick", "keychain", "chicken", "light", "pocketknife", "shirt", "monitor", "magnet", "window", "keyboard", "frog", "pasta", "shovel", "tomato",
    "gun", "catalogue", "glue", "popcorn", "buckle", "ring", "dog", "cat", "rug", "goggles", "socks", "mirror", "letter-opener", "socks", "hat", "tree",
    "harmonica", "matchbook", "straw", "washing-machine", "perfume", "shampoo", "sunglasses", "bananas", "rope", "matches", "statue", "map", "pony", "paperclip",
    "extension-cord", "soap", "salt", "shaker", "keys", "slipper", "giraffe", "apple", "outlet", "clothes", "zebra", "necktie", "flowers", "credit-card",
    "whistle", "couch", "seatbelt", "pencil", "shoelace", "lightbulb", "spring", "pencil", "toilet-paper ", "string", "guitar", "swing", "handcuffs",
    "hairbrush", "dice", "conditioner", "eyeliner", "glowstick", "syrup", "flag", "joke", "button", "glitter", "ink", "iPod", "cards", "box", "sailboat",
    "plane", "lighter", "phone", "purse", "money", "screwdriver", "nail", "gloves", "desk", "photo", "balloon", "fridge", "lace", "sponge", "ball", "needle",
    "lipgloss", "binoculars", "sandals", "deodorant", "cork", "bowl", "sidewalk", "crayons", "eraser", "oil", "gum", "candybar", "stick", "door", "charger", "sword", "icecube", "jam", "white", "lotion", "bow",
    "earrings", "blouse", "wishbone", "pinecone", "bed", "bread", "tv", "unicorn", "beef", "stamp", "sofa", "pillow", "pocketwatch", "shoes", "squirrel", "zipper",
    "radio", "whip", "jar", "thread", "pan", "chalk", "tongs", "sheep", "dictionary", "crowbar", "flowers", "basketball", "tissues", "beans", "whale",
    "bell", "pills", "fan", "wristwatch", "purse", "phone", "comb", "cow", "cookie", "feather", "teddies", "glasses", "towel", "sunscreen", "pants",
    "rubberbands", "table", "blowdryer", "canteen", "Christmas ", "spectacles", "drawer", "keychain", "videogames", "checkbook", "microphone", "incense",
    "groceries", "cucumber", "robot", "house", "turtle", "trash", "candle", "magnifying-glass", "brush", "thread", "spatula", "leg", "notebook", "paint",
    "hanger", "water", "camera", "tennis ", "canvas", "novel", "lotion", "notepad", "shirt", "bandana", "puddle", "butter", "helmet", "toothpaste", "fish", "vase", "wifi",
    "pool ", "change", "chess", "rhino", "rabbit", "computer", "speakers", "broccoli", "pouch", "lemon", "martini ", "glass", "chair", "pudding", "wine ", "stockings", "Netflix", "GOT", "piano",
    "astronaut", "computer", "vodka", "coke", "university", "drink", "beer", "ps4", "girl", "boy", "muscle", "gym", "screen", "shot", "tequila", "test",
    "bowl", "sushi", "doctor", "engineer", "helicopter", "ironman", "avengers", "Eminem", "money", "cloud", "song", "spirit", "ghost ", "macaron", "chicken",
    "bike", "seat", "mouth", "lips", "nose", "eyes", "green", "chair", "rain", "thunder", "stage", "goal", "Ronaldo", "Messi", "island", "beach", "sea",
    "sand", "castle", "holiday", "Tom-Hanks", "Angelina-Jolie", "Scarlet-Johansson", "Bill-Gates", "Elon-Musk", "Jeff-Bezos", "Leonardo-DiCaprio", "snake", "spider",
    "bee", "wasp", "jungle", "monkey", "film", "cinema", "sun", "table", "space", "police", "shower", "smell", "belly", "apartment", "Paris", "London", "Athens",
    "Tokyo", "Barcelona", "Spain", "Sweden", "Harry-Kane", "storm", "skeleton", "sky", "night", "day", "Obama", "tent", "camping", "fishing", "bird", "flying",
    "war", "Earth", "Mars", "poker", "casino", "omelet", "run", "church", "gun", "fire", "air", "breath", "kitchen", "bin", "garden", "tree", "snail", "skull",
    "death", "brain", "suit", "floor", "dancing", "south", "east", "theory", "maths", "physics", "cheese", "Siri", "retirement","health", "field", "pitch",
    "stranger", "view", "expensive", "old", "funny", "ticket", "unique", "pizza", "pig", "channel", "cave", "wood", "doll", "alive", "belief", "hot",
    "son", "daughter", "playground", "disease", "virus", "smart", "record", "list", "mystery", "venom", "thumb", "flood", "brick", "pocket", "elbow",
    "government", "giant", "glacier", "lick", "grape", "father", "quill", "sleep", "hospital", "volcano", "blind", "pet", "eyebrows", "wings", "salsa",
    "moon", "planet", "asteroid", "cell", "tomato", "owl", "Harry-Potter", "Voldemort", "dragon", "Barney-Stinson", "lawyer", "steak", "boxers",
    "body", "sheets", "blood", "fridge", "rice", "salmon", "ski", "beam", "tear", "Beyonce ", "luck", "music", "poison", "bell", "alarm", "seal", "cut",
    "cherry", "locket", "cold", "orange", "knee", "school", "teacher", "snore", "baby", "Instagram", "farm", "horse", "crab", "mail", "mailbox", "pyramids", "skin",
    "sugar", "circle", "train", "bear", "wave", "squid", "ten", "time", "hour", "minute", "drums", "skateboarding",
  ];

  String random_text_guess = "";

  // TODO: Add _interstitialAd
  InterstitialAd _interstitialAd;

  // TODO: Add _isInterstitialAdReady
  bool _isInterstitialAdReady = false;

  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {

            },
          );
          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _initGoogleMobileAds();
    _loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(

      child: GestureDetector(
        onTap: (){
          var now = new DateTime.now();
          Random rnd = new Random();
          Random rnd2 = new Random(now.millisecondsSinceEpoch);

          int min = 0, max = word_list.length;
          int r = min + rnd.nextInt(max - min);
          // print("$r is in the range of $min and $max"); // e.g. 31
          // used as a function nextInter:

          int r2 = min + rnd2.nextInt(max - min);
          setState(() {
            random_text_guess = word_list[r2];
          });

          if (_isInterstitialAdReady) {
            _interstitialAd?.show();
          }

        },
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
                SizedBox(height: 20,),
                Column(
                  children: <Widget>[
                    Text('Describe',style: TextStyle(fontSize: _large? 60: (_medium? 55: 50), fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: _width/20,
                    ),
                    Container(
                      width: _width/8,
                      child: Image.asset(
                        'assets/images/cup_left.png',
                        height: _height/4,
                        width: _width/8,
                      ),
                    ),
                    Container(
                      width: _width*13/20,
                      child:  Text(random_text_guess,style: TextStyle(fontSize: _large? 50: (_medium? 48: 45), fontWeight: FontWeight.bold,
                      color: Colors.yellow,), textAlign: TextAlign.center,),
                    ),
                    Container(
                      width: _width/8,
                      child: Image.asset(
                        'assets/images/cup_right.png',
                        height: _height/4,
                        width: _width/8,
                      ),
                    ),
                    Container(
                      width: _width/20,
                    ),
                  ],
                ),
                SizedBox(height: _height/10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child:  Text("Tap to continue",style: TextStyle(fontSize: _large? 30: (_medium? 28: 26), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      )

    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();

    super.dispose();
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
