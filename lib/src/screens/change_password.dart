import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/authetication/auth_event.dart';
import 'package:xcut_frontend/src/bloc/authetication/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/models/models.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKeySignup = GlobalKey<FormState>();
  final Map<String, dynamic> _passwords = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKeySignup,
          child: Column(children: [
            SizedBox(height: 150),
            SizedBox(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Old Password',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade700, letterSpacing: 0.5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade700, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.5),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      this._passwords['oldPassword'] = value;
                    });
                  }),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.grey.shade700, letterSpacing: 0.5),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade700, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2.5),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      this._passwords['password'] = value;
                    });
                  }),
            ),
            SizedBox(height: 50),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Text(
                    'Change Password',
                    style: GoogleFonts.poppins(
                        fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.grey.shade700)),
                  onPressed: () {
                    changePassword(context, this._passwords);
                  },
                )
            ),
          ]),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}

changePassword(BuildContext context, Map<String, String> userPassword) async {
  BlocProvider.of<AuthBloc>(context)
      .add(AuthUpdate(userPassword['oldPassword'], userPassword['password']));
  await TokenHandler.removeToken();
  Navigator.pushNamed(context, '/login');
}
