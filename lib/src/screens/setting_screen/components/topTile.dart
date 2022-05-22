import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Widget topTile() {

String? email = auth.currentUser?.email;

  return ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage(
        'assets/images/lamp.png',
      ),
    ),
    title: Text(
      email!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      'Flutter Designer',
    ),
  );
}
