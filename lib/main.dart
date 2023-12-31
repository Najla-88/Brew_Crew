import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/servises/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// StreamProvider<NewUser?>.value(
//     value: AuthService().user,
//     initialData: null,
//     child: const MaterialApp(
//       home: Wrapper(),

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthServices().user,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
    // Widget build(BuildContext context) {
    //   return MaterialApp(
    //     home: Authenticate(),
    //   );
  }
}
