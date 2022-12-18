// still need improvement hshshshs

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ujikom_application/background/color_background.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  final controllerNama = TextEditingController();
  final controllerUsername = TextEditingController();
  final controllerTelepon = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Data User"),
          backgroundColor: hexStiringToColor("333333"),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerNama,
              decoration: decoration('Nama'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerUsername,
              decoration: decoration('Username'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerTelepon,
              decoration: decoration('Telepon'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerEmail,
              decoration: decoration('Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controllerPassword,
              decoration: decoration('Password'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () {
                final user = User(
                    nama: controllerNama.text,
                    username: controllerUsername,
                    telepon: controllerTelepon,
                    password: controllerTelepon);
                createUser(user);
                Navigator.pop(context);
              },
            )
          ],
        ),
      );

  InputDecoration decoration(String label) =>
      InputDecoration(labelText: label, border: OutlineInputBorder());

  Future createUser(user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

User(
    {required String nama,
    required TextEditingController username,
    required TextEditingController telepon,
    required TextEditingController password}) {}
