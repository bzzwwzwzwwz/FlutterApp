import 'package:flutter/material.dart';
import 'package:ujikom_application/background/color_background.dart';
import 'package:ujikom_application/screens/home_screens.dart';
import 'package:ujikom_application/screens/user_profile.dart';
import 'package:ujikom_application/widget/reuseable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signin_screen.dart';

class drawerScreen extends StatefulWidget {
  const drawerScreen({super.key});

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: hexStiringToColor("dddddd"),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              color: hexStiringToColor("333333"),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu Pilihan",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => userProfile()));
              },
              leading: Icon(Icons.person_outline, size: 30),
              title: Text(
                "Akun",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Sign Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
              },
              leading: Icon(Icons.logout_outlined, size: 30),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ));
  }
}
