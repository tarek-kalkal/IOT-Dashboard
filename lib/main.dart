import 'package:flutter/material.dart';
import 'package:iotplug/Activities/About.dart';
import 'package:iotplug/Activities/CommingSoon.dart';
import 'package:iotplug/Activities/DashboardActivity.dart';
import 'package:iotplug/Activities/MainActivity.dart';
import 'package:iotplug/Activities/Settings.dart';
import 'package:iotplug/Activities/login.page.dart';
import 'package:iotplug/Activities/newuser.page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(Where());
}

class Where extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WhereState();
  }
}

class WhereState extends State<Where> {

  dynamic dsv;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginPage(),
          '/signUp': (BuildContext context) => new NewUser(),
         '/mainActivity': (BuildContext context) => new MainActivity(),
          '/about': (BuildContext context) => new About(),
          '/commingSoon': (BuildContext context) => new CommingSoon(),
           '/dashboard': (BuildContext context) => new DashboardActivity(),
          '/settings' : (BuildContext context) => new Settings()
        },
        home:

            SplashScreen(
              seconds: 4,
              //navigateAfterSeconds: dsv,
              title: new Text(
                'Welcome to Dashboard',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              image: new Image.asset('assets/images/iot.png'),
              gradientBackground: new LinearGradient(
                  colors: [Colors.blueGrey, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 60.0,
              onClick: () => print("click onScreen!!"),
              // i can add  progress bar or something by editing SplashScreen Library .
              //loaderColor: null
            ),
//            FutureBuilder(
//                future: _getPrefs(),
//                builder: (BuildContext context, snapshot) {
//                  if (snapshot.hasData) {
//                    bool state = str.getBool('isLoged');
//
//                    if (state == true) {
//                      Navigator.of(context)
//                          .pushNamedAndRemoveUntil('/mainActivity', (Route<dynamic> route) => false) ;
//                    } else {
//                      Navigator.of(context)
//                          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
//                    }
//                    //return MainActivity();
//                  }
//
//                  /// other way there is no user logged.
//                  return CircularProgressIndicator();
//                })
          );

  }

//  Future<void> _getPrefs() async{
//     str = await SharedPreferences.getInstance();
//  }
}
