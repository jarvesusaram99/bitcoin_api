import 'package:flutter/material.dart';
import 'package:login_app/pages/Widgets/homepage.dart';
import 'package:login_app/pages/news.dart';

void main() {
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
    routes: {
      // "/home": (context) => MyApp(),
      "/": (context) => HomePage(),
      "/news":(context) => NewsApp(),
    },
    title: "Fonemint",
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    )
  );
}

