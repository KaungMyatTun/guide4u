import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide4u/data/HexColor.dart';
import 'package:guide4u/main.dart';
import 'package:guide4u/app_screens/OwnerSignIn.dart';
import 'package:guide4u/data/FormValidator.dart';
import 'package:guide4u/services/authentication.dart';

class OwnerSignUp extends StatefulWidget {
  final BaseAuth auth;

  const OwnerSignUp({Key key, this.auth}) : super(key: key);
  
  @override
  _OwnerSignUpState createState() => _OwnerSignUpState();
}

class _OwnerSignUpState extends State<OwnerSignUp> {
  String _email;
  String _password;
  final _formKey = new GlobalKey<FormState>();
  bool _isLoading;
  bool _obscureText = true;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

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
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                  child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _showEmailInput(context),
                    _showPasswordInput(context),
                    _signUp(context),
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('---------- OR ----------'),
                      ),
                    ),
                    _wSignInWithMobile(context),
                    _wSignInWithFacebook(context),
                    _wAlreadyHaveAccount(context),
                    _showCircularProgress()
                  ],
                ),
              )),
            ],
          )),
        ));
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Container(
          margin: EdgeInsets.only(top: 5), child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showEmailInput(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        validator: (value) => FormValidator().validateEmail(value),
        onSaved: (value) => _email = value.trim(),
      ),
      width: MediaQuery.of(context).size.width / 1.5,
    );
  }

  Widget _showPasswordInput(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: new TextFormField(
        autofocus: false,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              semanticLabel: _obscureText ? 'show password' : 'hide password',
            ),
          ),
        ),
        validator: (value) => FormValidator().validatePassword(value),
        onSaved: (value) => _password = value.trim(),
      ),
      width: MediaQuery.of(context).size.width / 1.5,
    );
  }

  Widget _signUp(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 1.5,
      height: 40,
      child: RaisedButton(
          color: Theme.of(context).accentColor,
          child: Text('Sign Up'),
          onPressed: () {
            _signUpWithEmailandPass(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget _wSignInWithMobile(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 1.5,
      height: 40,
      child: RaisedButton(
          color: Theme.of(context).accentColor,
          child: Text('Sign in with mobile number'),
          onPressed: () {
            //_signInWithMobile(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget _wSignInWithFacebook(BuildContext context) {
    return Container(
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
            //_signInWithFacebook(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0))),
    );
  }

  Widget _wAlreadyHaveAccount(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('already have account ? '),
            ),
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  _goBckToSignIn(context);
                },
                child: Text(
                  ' Sign In',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _goBackToOwnerMain(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(3)));
  }

  _goBckToSignIn(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OwnerSignIn()));
  }

  void _signUpWithEmailandPass(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    if (_validateAndSave()) {
      String userId = '';

      try {
        if (!(_isLoading)) {
          userId = await widget.auth.signUp(_email, _password);
          print('Signed up user : $userId');
        }
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _formKey.currentState.reset();
        });
      }
    }
  }
}
