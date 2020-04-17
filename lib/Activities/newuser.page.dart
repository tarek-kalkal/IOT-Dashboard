import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iotplug/Activities/MainActivity.dart';
import 'package:iotplug/widgets/login/singup.dart';
import 'package:iotplug/widgets/login/buttonNewUser.dart';
import 'package:iotplug/widgets/login/newEmail.dart';
import 'package:iotplug/widgets/login/newName.dart';
import 'package:iotplug/widgets/login/password.dart';
import 'package:iotplug/widgets/login/textNew.dart';
import 'package:iotplug/widgets/login/userOld.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.page.dart';

class NewUser extends StatefulWidget {

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {

  TextEditingController nameController = new TextEditingController() ;
  TextEditingController emailController = new TextEditingController() ;
  TextEditingController passwordController = new TextEditingController() ;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 10),
                      child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            'Sing up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                            ),
                          )),
                    ),
                    TextNew(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: nameController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.lightBlueAccent,
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: emailController,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.lightBlueAccent,
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                )

                ,
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                )

                ,
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[300],
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: 1.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              5.0, // vertical, move down 10
                            ),
                          ),
                        ],
                        color: Colors.white, borderRadius: BorderRadius.circular(30)),
                    child: FlatButton(
                      onPressed: () {
                       setState(() {
                        signIn();
                        print("SignUp");
                       });
                       },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                )

                ,
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    alignment: Alignment.topRight,
                    //color: Colors.red,
                    height: 20,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Have we met before?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Sing in',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

                ,
              ],
            ),
          ],
        ),
      ),
    );
  }


  void signIn() async {


    Firestore.instance
        .collection('Users')
        .add({
      "name": nameController.text,
      "email":emailController.text ,
      "password" : passwordController.text ,
    })
        .then((result) => {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/mainActivity', (Route<dynamic> route) => false),
      // Navigator.push(context,
     //     MaterialPageRoute(builder: (context) => MainActivity()))
      //taskTitleInputController.clear(),
      //taskDescripInputController.clear(),
    }).catchError((err) {
      print(err);
      return ;
    });

    storeDataLocally();

  }

  void storeDataLocally() async {
    SharedPreferences str = await SharedPreferences.getInstance();
    str.setBool('isLoged', true) ;
    str.setString('name', nameController.text) ;
    str.setString('email', nameController.text) ;
    str.setString('password',passwordController.text) ;
    print('done') ;
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}