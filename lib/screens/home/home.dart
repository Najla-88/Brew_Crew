import 'package:brew_crew/servises/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              icon: Icon(Icons.person),
              label: Text('logout')),
        ],
      ),
    );
  }
}
