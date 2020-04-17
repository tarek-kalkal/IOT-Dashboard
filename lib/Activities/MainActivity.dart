import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iotplug/Activities/About.dart';
import 'package:iotplug/Activities/CommingSoon.dart';
import 'package:iotplug/Activities/DashboardActivity.dart';
import 'package:iotplug/Activities/Settings.dart';

import 'package:iotplug/models/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainActivity extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _name = '';
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  Future<void> _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('name');

    setState(() => _name = '$userName');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        height: MediaQuery.of(context).copyWith().size.height ,
        child: Column(
          children: <Widget>[
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                  padding:
                  EdgeInsets.only(top: 40, right: 40, left: 40, bottom: 5),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        ),
                      ],

                      gradient: new LinearGradient(
                          colors: [lightBlueIsh, lightGreen],
                          begin: const FractionalOffset(1.0, 1.0),
                          end: const FractionalOffset(0.2, 0.2),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),

                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(0))),
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                         Container(
                          margin: EdgeInsets.only(bottom: 5),
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(

                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        "https://i.imgur.com/BoN9kdC.png")
                                )
                            )),

                        Text(
                          '$_name ',
                          style: titleStyleWhite,
                        ) ,
                        FlatButton(
                          child: Text("Power off", style: titileStyleLighterBlack),
                          onPressed: signOut,
                        ),
                      ],
                    ),
                  ),
                ),

//

                Container(
                  height: 460,
                  margin: EdgeInsets.only(top: 125),
                  padding: EdgeInsets.only(top: 100 ),
                  child: ListView(
                    children: getJobCategories(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<String> jobCategories = [
    "Dashboard",
    "Settings",
    "Comming soon",
    "Comming soon",
    "About"
  ];

  Map jobCatToIcon = {
    "Dashboard": Icon(
      Icons.dashboard,
      color: lightBlueIsh,
      size: 50,
    ),
    "Settings": Icon(Icons.settings, color: lightBlueIsh, size: 50),
    "Comming soon": Icon(Icons.signal_wifi_off, color: lightBlueIsh, size: 50),
    "Comming soon": Icon(Icons.signal_wifi_off, color: lightBlueIsh, size: 50),
    "About": Icon(Icons.info_outline, color: lightBlueIsh, size: 50),
  };

  Widget getCategoryContainer(String categoryName) {
    return new Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: 180,
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(categoryName, style: titileStyleLighterBlack),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 100,
            width: 70,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white,
              child: jobCatToIcon[categoryName],
              elevation: 10,
              onPressed: () {
                navigateTo(categoryName) ;
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getJobCategories() {
    List<Widget> jobCategoriesCards = [];
    List<Widget> rows = [];
    int i = 0;
    for (String category in jobCategories) {
      if (i < 2) {
        rows.add(getCategoryContainer(category));
        i++;
      } else {
        i = 0;
        jobCategoriesCards.add(new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows,
        ));
        rows = [];
        rows.add(getCategoryContainer(category));
        i++;
      }
    }
    if (rows.length > 0) {
      jobCategoriesCards.add(new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));
    }
    return jobCategoriesCards;
  }

  void navigateTo (String categoryName) {
    switch (categoryName) {

      case "Dashboard" :
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardActivity()));
        break ;
      case "Settings" :
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Settings()));
        break ;
      case "Comming soon" :
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CommingSoon()));
        break ;
      case "Comming soon" :
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CommingSoon()));
        break ;
      case "About" :
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => About()));
        break ;


    }
  }

  Future<void> signOut() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLoged', false);
    print("sign out");
  }
}
