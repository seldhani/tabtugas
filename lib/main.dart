import 'package:flutter/material.dart';

import 'tabscreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: TabScreen(),
    ),
  );
}


class User {
  final String Alamat;
  final String Kabupaten;

  User({required this.Alamat, required this.Kabupaten});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Alamat: json['Alamat'] ?? 'No Address',
      Kabupaten: json['Kabupaten'] ?? 'No Region',
    );
  }
}
