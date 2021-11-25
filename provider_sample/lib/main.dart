import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/model/themes.dart';
import 'package:provider_sample/provider/user_notifier.dart';
import 'package:provider_sample/view/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserNotifier(),
      )
    ],
    child: MyApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserNotifier(),
      child: Consumer<UserNotifier>(
          builder: (context, UserNotifier themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Theme Provider',
          theme: themeNotifier.darkTheme ? dark : light,
          // ignore: prefer_const_constructors
          home: HomeScreen(),
        );
      }),
    );
  }
}
