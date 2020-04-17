import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ButtonNewUser extends StatefulWidget {
  @override
  _ButtonNewUserState createState() => _ButtonNewUserState();
}

class _ButtonNewUserState extends State<ButtonNewUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            signIn();
            print("SignUp");
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
    );
  }

  void signIn() {
    Firestore.instance
        .collection('tasks')
        .add({
      //"title": taskTitleInputController.text,
      //"description": taskDescripInputController.text
    })
        .then((result) => {
      Navigator.pop(context),
      //taskTitleInputController.clear(),
      //taskDescripInputController.clear(),
    }).catchError((err) => print(err));

  }
}