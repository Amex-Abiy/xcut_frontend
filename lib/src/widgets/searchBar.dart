import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
            contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
            filled: true,
          fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.grey.shade900, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
          ),
        ),
      ),
    );
  }
}