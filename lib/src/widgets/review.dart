import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/widgets/rating_star.dart';

class ReviewCard extends StatelessWidget {
  final String barberShopId;
  final String email;
  final String dateTime;
  final int rating;
  final String review;

ReviewCard(this.barberShopId, this.email, this.dateTime, this.rating, this.review);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.email != null ? this.email : '',
                    style: GoogleFonts.poppins(color: Colors.grey.shade600)),
                IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey.shade600),
                    onPressed: () => {
                      print(this.barberShopId),
                      BlocProvider.of<UserBloc>(context).add(UserDeleteReview(this.barberShopId))
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ratingStar(this.rating != null ? this.rating : ''),
                Text('22 Jan, 2021',
                    style: GoogleFonts.poppins(color: Colors.grey.shade600))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                this.review,
                style: GoogleFonts.poppins(color: Colors.grey.shade400),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget ratingStar(rating) {
  return Row(children: [RatingStar(), RatingStar()]);
  // List<Widget> ratingsStars = [];
  // if(rating != null) {
  //   for(var i = 0; i < rating; i++) {
  //   ratingsStars.add(RatingStar());
  // }
  // return Row(
  //   children: ratingsStars,
  // );
  // } else {
  //    Row(
  //   children: ratingsStars,
  // );
  // }
  // return null;
}
