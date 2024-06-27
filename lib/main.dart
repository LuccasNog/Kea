import 'package:decor/app/View/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (errorMsg) {
    print(errorMsg);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kea',
      theme: ThemeData(
          //primarySwatch: Colors.black12,
          ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
