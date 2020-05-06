import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:reparosya/general/ui/components/chatItemComponent.dart';

Map<String, IconData> servicesMap = {};

class MessagingBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: ListView(
        children: <Widget>[
          ChatItemWidget(name: "Conectados SRL", lastMessage: "Revisaremos su caso en un segundo", imgUrl: "", date: "Hoy", time: "Justo ahora",),
          ChatItemWidget(name: "Taller Mecánico Pepe", lastMessage: "Un gusto haber trabajado con usted", imgUrl: "", date: "Hace dos dias", time: "13:57",),
        ],
      ),
    );
  }
}