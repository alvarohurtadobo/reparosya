

import 'package:flutter/material.dart';
import 'package:reparosya/user/ui/addressPage.dart';
import 'package:reparosya/general/ui/pagedView.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch (settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => Home());
      case "/address":
        return MaterialPageRoute(builder: (_) => AddressPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error")
        ),
        body: Center(
          child: Text("Página no encontrada"),
        )
      );
    });
  }
}