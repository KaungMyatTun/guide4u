import 'package:flutter/material.dart';
import 'package:guide4u/app_screens/OwnerSignIn.dart';

class OwnerMainPage extends StatefulWidget {
  @override
  _OwnerMainPageState createState() => _OwnerMainPageState();
}

class _OwnerMainPageState extends State<OwnerMainPage> {
  bool isLogin = true;
  void _signOut() {
    setState(() {
      isLogin = !isLogin;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Container(
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
                child: _checkedUserSignInOrNot(isLogin),
              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                height: 35,
                child: RaisedButton(
                    color: Colors.white,
                    child: Text('Sign Out'),
                    onPressed: () {
                      _signOut();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _checkedUserSignInOrNot(bool checked){
  Widget widget;
  if(checked){
    widget = _HeaderBeforeLogin();
  }else{
    widget = _HeaderAfterLogin();
  }
  return widget;
}

class _HeaderBeforeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.person,
            size: 80,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width / 2.0,
          height: 35,
          child: RaisedButton(
              color: Colors.white,
              child: Text('Sign In or Register'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OwnerSignIn()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
        ),
      ],
    );
  }
}

class _HeaderAfterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text("After Login")],
    );
  }
}
