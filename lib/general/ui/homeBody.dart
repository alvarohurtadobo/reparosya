

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reparosya/general/ui/components/categoryCard.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/carouselComponent.dart';

class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Destacados")
                ),
                Container(
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CarouselItemWidget(title: "Conectados SRL", subtitle: "Electricistas desde 100 bs la consulta", imgUrl: "", rate: 5,),
                      CarouselItemWidget(title: "Taller Mecánico Pepe", subtitle: "Albañiles responsables a tu servicio", imgUrl: "", rate: 2.5,),
                      CarouselItemWidget(title: "Plomeros a domicilio", subtitle: "Servicios de plomería accesible", imgUrl: "", rate: 3.5,),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text("Nuestros profesionales y empresas")
                ),
                Column(
                  children: <Widget>[
                    CategoryItemWidget(title: "Plomeros a domicilio", subtitle: "Desde 80 bs por consulta", imgUrl: "", rate: 3.5, status: "Abierto", action: "Solicitar"),
                    CategoryItemWidget(title: "Conectados SRL", subtitle: "Desde 100 bs por consulta", imgUrl: "", rate: 5, status: "Cerrado", action: "Enviar mensaje"),
                    CategoryItemWidget(title: "Tu Casa SRL", subtitle: "Desde 60 bs por consulta", imgUrl: "", rate: 2.5, status: "Abierto", action: "Solicitar"),
                    CategoryItemWidget(title: "Taller Mecánico Pepe", subtitle: "Consultas gratis", imgUrl: "", rate: 1.5, status: "Cerrado", action: "Enviar mensaje"),
                  ],
                ),
              ],
            ),
          ),
          AdsView(screenWidth: screenWidth, imagePath: "img/chavez.jpg", destinyUrl: "http://www.farmaciachavez.com.bo/"),
        ],
      ),
    );
  }
}

class AdsView extends StatefulWidget{
  final double screenWidth;
  final String imagePath;
  final String destinyUrl;

  AdsView({Key key, this.screenWidth, this.imagePath, this.destinyUrl}) : super(key : key);

  @override
  _AdsViewState createState() => _AdsViewState();
}

class _AdsViewState extends State<AdsView> {
  bool open = true;
  @override
  Widget build(BuildContext context) {
    return open
    ? Container(
        width: widget.screenWidth,
        height: 80,
        child: Stack(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: (){
                  _launchURL(widget.destinyUrl);
                },
                child: Image.asset("img/chavez.jpg")
              ),
            ),
            Positioned(
              top: 0,
              left: widget.screenWidth-64,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    this.open = false;
                  });
                },
                child: Icon(Icons.close, size: 32, color: Colors.black,)
              )
            )
          ],
        ),
      )
    : Container();
  }
}

_launchURL(String url) async {
  print("Launching $url");
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}