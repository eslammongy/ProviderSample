import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_sample/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            titleSpacing: 20.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.orange,
              statusBarIconBrightness: Brightness.dark,
            )),
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}
