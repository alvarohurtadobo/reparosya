import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<String> countries = ["Bolivia", "Argentina", "Mexico"];
String currentCountry = "Bolivia";

class PerfilBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: AssetImage('img/avatar.png'),
                radius: 100,
              ),
              Text("Alvaro Hurtado", style: Theme.of(context).textTheme.display1),
              Text("a.hurtado.bo@gmail.com", style: Theme.of(context).textTheme.display4),
            ],
          ),
          SizedBox(height: 40,),
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: "75402705",
                  enabled: true,
                  decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.phone),
                    ),
                  )
                ),
                TextFormField(
                  initialValue: "a.hurtado.bo@gmail.com",
                  enabled: true,
                  decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.place),
                    ),
                  )
                ),
                DropdownButton<String>(
                  itemHeight: 60,
                  value: currentCountry,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String newValue){
                    currentCountry = newValue;
                  },
                  items: countries.map<DropdownMenuItem<String>>((String country){
                    return DropdownMenuItem(
                      value: country,
                      child: ListTile(
                        leading: Icon(Icons.gps_not_fixed),
                        title: Text(country),
                      )
                    );
                  }).toList(),
                )
              ],
            )
          ),
          Divider(height: 20,),
          ListTile(
            leading: Icon(Icons.note),
            title: Text("Información legal"),
            // subtitle: Text("Obtiene un mes gratis al referir a un amigo"),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Refiere a un amigo"),
            subtitle: Text("Obtiene un mes gratis al referir a un amigo"),
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text("Cerrar sesión"),
            // subtitle: Text("Salir de "),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Mis direcciones"),
            trailing: FloatingActionButton(
              backgroundColor: Theme.of(context).hintColor,
              onPressed: (){
                print("About to launch Address Page");
                Navigator.of(context).pushNamed("/address");
              },
              child: Icon(Icons.add),
            ),
          ),
          
        ],
        
      ),
    );
  }
}