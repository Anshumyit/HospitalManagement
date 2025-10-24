import 'package:flutter/material.dart';
import 'package:hospitalmanagment/screen/login.dart';
import 'package:hospitalmanagment/view_model_controller/bottomNavigator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => bottomNavigtor()),

        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Management',
      home: LoginEmployees()
    );
  }
}
