import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingState();
  }
}

class SettingState extends State<Settings> {

  @override
  void initState() {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
//      body: Container(
//        color: Colors.grey[200],
//        height: MediaQuery.of(context).copyWith().size.height ,
//        child: Column(
//          children: <Widget>[
//            Stack(
//              fit: StackFit.passthrough,
//              children: <Widget>[
//                Container(
//                  padding:
//                  EdgeInsets.only(top: 40, right: 40, left: 40, bottom: 5),
//                  constraints: BoxConstraints.expand(height: 225),
//                  decoration: BoxDecoration(
//                      boxShadow: [
//                        new BoxShadow(
//                          color: Colors.grey,
//                          blurRadius: 10.0,
//                        ),
//                      ],
//
//                      gradient: new LinearGradient(
//                          colors: [Colors.black12, Colors.white70],
//                          begin: const FractionalOffset(1.0, 1.0),
//                          end: const FractionalOffset(0.2, 0.2),
//                          stops: [0.0, 1.0],
//                          tileMode: TileMode.clamp),
//
//                      borderRadius: BorderRadius.only(
//                        topLeft: Radius.elliptical(5, 10),
//                          bottomLeft: Radius.circular(40),
//                          bottomRight: Radius.circular(0))),
//                  child: Container(
//                    padding: EdgeInsets.only(top: 10),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//
//                        Container(
//                            margin: EdgeInsets.only(bottom: 5),
//                            width: 80.0,
//                            height: 80.0,
//                            decoration: new BoxDecoration(
//
//                                shape: BoxShape.circle,
//                                image: new DecorationImage(
//                                    fit: BoxFit.fill,
//                                    image: new _loadImage()
//                                )
//                            )),
//
//                        Text(
//                          '$_name ',
//                          style: titleStyleWhite,
//                        ) ,
//                        FlatButton(
//                          child: Text("Power off", style: titileStyleLighterBlack),
//                          onPressed: signOut,
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//
////
//
//                Container(
//                  height: 460,
//                  margin: EdgeInsets.only(top: 125),
//                  padding: EdgeInsets.only(top: 100 ),
//                  child: ListView(
//                    children: getJobCategories(),
//                  ),
//                )
//              ],
//            )
//          ],
//        ),
//      ),
    );
  }



  Future<Widget> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final isPic = prefs.getBool('isThereAPic');
    if(isPic == true)
    return  showimage();
    else
      return
    }


    Widget showimage() {
      return
        Container(
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
                                    image: new
                                )
                            ))]));


    }

}