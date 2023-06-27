import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),


    home: MyApp(),));

}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ماشین حساب من"
        ),
      ),
    );
  }
}
