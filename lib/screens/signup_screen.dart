import 'package:ujikom_application/screens/home_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ujikom_application/background/color_background.dart';
import 'package:ujikom_application/widget/reuseable_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'signin_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _namaTextController = TextEditingController();
  TextEditingController _teleponTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Register",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStiringToColor("333333"),
            hexStiringToColor("333333")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield("Username", Icons.person_outline, false,
                    _userNameController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield("Nama Lengkap", Icons.person_outline, false,
                    _namaTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield("Nomor Telepon", Icons.phone_outlined, false,
                    _teleponTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield(
                    "Email", Icons.mail_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextfield("Password", Icons.lock_outline, false,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signinSignupButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Create New Account");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ))),
    );
  }

  Future addUserDetails(String usernama, String nama, String telepon,
      String email, String pasword) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Username': usernama,
      'Name': nama,
      'Phone': telepon,
      'Email': email,
      'Password ': pasword
    });
  }
}
