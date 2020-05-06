

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationsBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          myCard(context, "Tu plomero llegó", "Tu servicio se encuentra en tu domicilio", Icons.notifications),
          myCard(context, "Tu electricista llegó", "Tu servicio se encuentra en tu domicilio", Icons.notifications),
          myCard(context, "Problema de pago", "Tu tarjeta no pudo ser procesada", Icons.payment),
        ],
      ),
    );
  }
}


Widget myCard(BuildContext context, String title, String message, IconData myIcon){
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(myIcon),
            title: Text(title),
            subtitle: Text(message),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Cerrar'),
                onPressed: () { /* ... */ },
              ),
              FlatButton(
                child: const Text('Enviar mensaje'),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}