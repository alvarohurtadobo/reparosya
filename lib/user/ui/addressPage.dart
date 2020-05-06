
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:reparosya/general/ui/components.dart';

class AddressPage extends StatefulWidget{
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool acceptedFirstAddress;
  double lat;
  double lon;

  @override
  void initState() {
    super.initState();
    acceptedFirstAddress = true;
    lat = -16.4897;
    lon = -68.1193;
  }

  @override
  Widget build(BuildContext context) {
    print("Building Address Page in ($lat, $lon)");
    return Scaffold(
      appBar: myAppBar(context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                FlutterMap(
                    options: new MapOptions(
                      center: new LatLng(lat, lon),
                      zoom: 15.0,
                      onPositionChanged: (mapPostion,ret){
                        lat = mapPostion.center.latitude;
                        lon = mapPostion.center.longitude;
                        print("Changed to: ($lat,$lon)");
                      },
                      onTap: (LatLng myPostition){
                        print("Tapped position: (${myPostition.latitude}, ${myPostition.longitude})");
                      },
                    ),
                    layers: [
                      new TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c']
                      ),
                      // new CircleLayerOptions(
                      //   circles: [new CircleMarker(color: Colors.transparent, borderColor: Colors.green, borderStrokeWidth: 5, point: LatLng(-16.4897, -68.1193),useRadiusInMeter: true, radius: 150)]
                      // ),
                      // new MarkerLayerOptions(
                      //   markers: [
                      //     new Marker(
                      //       width: 80.0,
                      //       height: 80.0,
                      //       // anchorPos: AnchorPos.exactly(Anchor()),
                      //       point: new LatLng(-16.4897, -68.1193),
                      //       builder: (ctx) =>
                      //       new Container(
                      //         child: new Icon(Icons.gps_fixed),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                
                Center(child: Icon(Icons.gps_fixed, size: 25,color: Theme.of(context).primaryColorLight,),),
              ],
            ),
          ),
          acceptedFirstAddress
          ? Container(

              padding: EdgeInsets.symmetric(horizontal:20, vertical: 30),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Nombre para la ubicación',
                        labelStyle: Theme.of(context).textTheme.caption.apply(color: Theme.of(context).hintColor),
                        prefixIcon: Icon(Icons.note, color: Theme.of(context).hintColor),
                      ),
                      onChanged: (text){

                      },
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 3,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Detalles para la dirección',
                        labelStyle: Theme.of(context).textTheme.caption.apply(color: Theme.of(context).hintColor),
                        prefixIcon: Icon(Icons.view_headline, color: Theme.of(context).hintColor),
                      ),
                      onChanged: (text){
                        
                      },
                    ),
                  ],
                ),
              )
            )
          : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(acceptedFirstAddress){
            print("Pop");
            Navigator.of(context).pop();
          }
          else{
            print("Toggle");
            setState(() {
              acceptedFirstAddress = true;
            });
          }
        },
        child: acceptedFirstAddress ? Icon(Icons.save) : Icon(Icons.check)
      ),
    );
  }
}