
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyProjects extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Column(
        children: <Widget>[
          _searchBar(context),
          _cardsView(context),
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context){
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            initialValue: "",
            enabled: true,
            decoration: InputDecoration(
              hintText: "Búsqueda",
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.search),
              ),
            )
          ),
        ),
        Text("Todos:"),
        CupertinoSwitch(
          value: true,
          activeColor: Theme.of(context).hintColor,
          onChanged: (bool value){
            print("Changing state");
          },
        ),
      ],
    );
  }

  Widget _cardsView(BuildContext context){
    return Expanded(
      child: ListView(
        children: <Widget>[
          myCard(context,"Servicio de Electricista", "Servicio de electricista realizado por Conectados SRL en fecha 25 de Abril de 2020", Icons.flash_on),
          myCard(context,"Servicio de Mecánica", "Servicio de plomería realizado por Taller Mecánico Pepe en fecha 10 de Marzo de 2020", Icons.local_car_wash),
          myCard(context,"Servicio de Albañil", "Servicio de plomería realizado por Stanley Gutierrez en fecha 31 de Diciembre de 2019", Icons.directions_walk),
          myCard(context,"Servicio de Plomería", "Servicio de plomería realizado por José Ramirez en fecha 7 de Noviembre de 2019", Icons.opacity),
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
                child: const Text('Ver detalle'),
                onPressed: () { /* ... */ },
              ),
              FlatButton(
                child: const Text('Volver a contratar'),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

