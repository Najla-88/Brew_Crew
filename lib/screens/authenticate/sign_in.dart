import 'package:brew_crew/servises/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  // text field state
  String email = '';
  String password = '';

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  child: Text(
                    'sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(password);
                    print(email);
                  },
                )
              ],
            ),
          )

          // ElevatedButton(
          //   child: Text('Sign in anonymously'),
          //   onPressed: () async {
          //     dynamic result = await _auth.signInAnon();
          //     if (result == null) {
          //       print('error signing in');
          //     } else {
          //       print('signed in');
          //       print(result.uid);
          //     }
          //   },
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.brown[50],
          //     onPrimary: Colors.black,
          //   ),
          // ),
          ),
    );
  }
}
