import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nkap_earn/services/firebase_auth.service.dart';
import 'package:nkap_earn/widgets/auth_landing.dart';
import 'package:provider/provider.dart';

import 'strings.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseAuthService>(
      builder: (_) => FirebaseAuthService(),
      child: MaterialApp(
        title: Strings.app_name,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthLanding(),
      ),
    );
  }
}

/*
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello World',
            ),
          ],
        ),
      ),
    );
  }
}
*/
