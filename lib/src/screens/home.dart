import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/widgets/barbershop_card.dart';
import 'package:xcut_frontend/src/widgets/searchBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 35),
          SafeArea(
            child: SearchBar()
          ),
          barberShops()
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}

Widget barberShops() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
    child: Column(
      children: [
        BarberShopCard(),
        BarberShopCard()
      ],
    ),
  );
}
