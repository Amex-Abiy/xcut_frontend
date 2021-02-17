import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/widgets/review.dart';

class BarberShopDetails extends StatelessWidget {
  const BarberShopDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 2 * (MediaQuery.of(context).size.height / 5),
                  child: Image(
                    image: NetworkImage('https://stmedia.stimg.co/ows_d296d5ef-c8dc-4b18-b11b-0721ef8f7027.jpg?fit=crop&crop=faces'),
                    fit: BoxFit.fill,
                  )
                ),
                Container(
                  height: 40,
                  child: Center(
                    child: Text('Kebede\'s Barbershop', 
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('4.2', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 30),),
                      FlatButton(
                        child: Text('Add Review', style: GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.amber.shade500),),
                        color: Theme.of(context).primaryColorDark,
                        onPressed: () => {}
                      )
                    ],
                  ),
                ),
                reviews(),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: RaisedButton(
                child: Text('Book Appointment', style: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),),
                color:  Theme.of(context).primaryColorDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Theme.of(context).primaryColor, width: 1.5)
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, '/')
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}

Widget reviews() {
  return Column(
    children: [
      ReviewCard(),
      ReviewCard(),
      ReviewCard()
    ]
  );
}