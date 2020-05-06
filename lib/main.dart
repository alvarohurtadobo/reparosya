import 'package:flutter/material.dart';
import 'package:reparosya/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reparos ya',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily            : 'Poppins',
        primaryColor          : Colors.white,
        brightness            : Brightness.light,
        primaryColorLight     : Color(0xff120136),
        secondaryHeaderColor  : Color(0xff035aa6),
        cursorColor           : Color(0xffffffff),
        accentColor           : Color(0xff120136),      // Buttons?
        focusColor            : Color(0xfffcbf1e),
        hintColor             : Color(0xff40bad5),
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 24),
          display1: TextStyle(fontSize: 30),
          display2: TextStyle(fontSize: 20),
          display3: TextStyle(fontSize: 18),
          display4: TextStyle(fontSize: 16),
          subhead: TextStyle(fontSize: 15),
        )
      )
    );
  }
}
