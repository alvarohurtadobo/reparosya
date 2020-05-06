
import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).primaryColorLight,
    title: Text("Reparos ya", style: TextStyle(color: Theme.of(context).cursorColor),),
    actions: <Widget>[
      
    ],
  );
}