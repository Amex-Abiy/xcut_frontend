import 'package:flutter/material.dart';
import 'package:xcut_frontend/src/app.dart';
import 'package:xcut_frontend/src/screens/barbershop_details.dart';
import 'package:xcut_frontend/src/screens/home.dart';
import 'package:xcut_frontend/src/screens/signup.dart';
import 'package:xcut_frontend/src/style/HexColor.dart';
import 'src/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = HexColor('#191414');
    final light = HexColor('#fff');
    final green = HexColor('#1DB954');
    return MaterialApp(
      title: 'xcut',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: green,
        primaryColorDark: Colors.grey.shade900,
        primaryColorLight: light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => App(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/barbershopDetails': (context) => BarberShopDetails(),
      },
    );
  }
}

//
