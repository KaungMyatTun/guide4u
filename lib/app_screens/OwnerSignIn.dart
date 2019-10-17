import 'package:flutter/material.dart';
import 'package:guide4u/data/HexColor.dart';
import 'package:guide4u/main.dart';
import 'package:guide4u/app_screens/OwnerSignUp.dart';

class OwnerSignIn extends StatefulWidget {
  @override
  _OwnerSignInState createState() => _OwnerSignInState();
}

class _OwnerSignInState extends State<OwnerSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.9,
          centerTitle: false,
          title: Text('Guide4U'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            FlatButton(
              child: Text('Close', style: TextStyle(color: Colors.white)),
              onPressed: () {
                _goBackToOwnerMain(context);
              },
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Center(
              child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFC67A00), Color(0xFFC67A00)]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                        child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: Colors.black26)
                        ]),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          icon: Icon(Icons.email),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 5, color: Colors.black26)
                        ]),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          icon: Icon(Icons.vpn_key),
                          border: InputBorder.none),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 95),
                      child: Text('Forgot password ?'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('Sign in'),
                        onPressed: () {
                          _signInWithEmail(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('---------- OR ----------'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('Sign in with mobile number'),
                        onPressed: () {
                          this.dispose();
                          _signInWithMobile(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    child: RaisedButton(
                        color: HexColor('#3b5998'),
                        child: Text(
                          'Sign in with facebook',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _signInWithFacebook(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text('New User?'),
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              onTap: () {
                                _signUp(context);
                              },
                              child: Text(
                                ' Sign Up',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
            ],
          )),
        ));
  }
}

_goBackToOwnerMain(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(3)));
}

_signInWithEmail(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(3)));
}

_signInWithMobile(BuildContext context) {}

_signInWithFacebook(BuildContext context) {}

_signUp(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OwnerSignUp()));
}
