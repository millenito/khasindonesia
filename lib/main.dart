import 'package:flutter/material.dart';
import 'package:khasindonesia/routes.dart';

// Jalankan aplikasinya
void main() => runApp(KhasindonesiaApp());

class KhasindonesiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khasindonesia',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: Home(), // Route home
    );
  }
}
