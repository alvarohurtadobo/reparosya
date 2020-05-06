

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IconCard extends StatelessWidget{
  final String name;
  final IconData myIconData;

  IconCard({Key key, this.name, this.myIconData = Icons.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 40,
            offset: Offset(0, 15)
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 13,
            offset: Offset(0, 3)
          ),
        ]
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(myIconData, color: Colors.white, size: 40,),
            Text(this.name, style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
          ],
        )
      ),
    );
  }
}