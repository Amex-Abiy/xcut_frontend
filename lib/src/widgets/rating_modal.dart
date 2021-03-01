class RatingModal extends StatefulWidget {
  RatingModal({Key key}) : super(key: key);

  @override
  _RatingModalState createState() => _RatingModalState();
}

class _RatingModalState extends State<RatingModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialogue(
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        childrem: [
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 5
           decoration: InputDecoration(
              hintText: 'Review',
              hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
              filled: true,
            fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
              ),
            ) 
          ),TextFormField(
           decoration: InputDecoration(
              hintText: 'rating',
              hintStyle: GoogleFonts.poppins(color: Colors.grey.shade700, letterSpacing: 0.5),
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
              filled: true,
            fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.5),
              ),
            ) 
          )
        ]
      )
    );
  }
}