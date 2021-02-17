import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/widgets/rating_star.dart';

class BarberShopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/barbershopDetails')
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 1.75,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade800, width: 0.5),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: Image(
                image: NetworkImage('https://stmedia.stimg.co/ows_d296d5ef-c8dc-4b18-b11b-0721ef8f7027.jpg?fit=crop&crop=faces'),
                fit: BoxFit.fill,
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: Text('Kebede\'s Barbershop', 
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Rating: ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey
                              ),
                              overflow: TextOverflow.clip
                            ),
                            ratingStar()
                          ],
                        ),
                        Text('Joined: 22 Jan, 2021',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey
                          ),
                          overflow: TextOverflow.clip
                        ),
                      ],
                    )
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.grey.shade500),
                        Text('Century Mall, Addis Ababa',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey
                          ),
                          overflow: TextOverflow.clip
                        ),
                      ],
                    )
                  )
                ]
              ),
            ),
          ]
        )
      ),
    );
  }
}

Widget ratingStar() {
  return Row(
    children: [
      RatingStar(),
      RatingStar(),
      RatingStar()
    ],
  );
}
