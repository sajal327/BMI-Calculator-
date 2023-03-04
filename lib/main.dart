// ignore_for_file: unused_import

import 'package:bmi_app/screens/home_screen1.dart';
import 'package:flutter/material.dart';
import 'provider/data.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DataProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
