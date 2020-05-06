import 'package:flutter/material.dart';

Map<String, String> string2AssetImage = {
  "Conectados SRL"        : "img/electricista.jpeg",
  "Plomeros a domicilio"  : "img/plomero.jpeg",
  "Tu Casa SRL"           : "img/albanil.jpeg",
  "Taller Mecánico Pepe"  : "img/auto.jpeg"};

class CarouselItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;
  final double rate;
  CarouselItemWidget({Key key, this.title, this.subtitle, this.imgUrl, this.rate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Building carousel for ${string2AssetImage[title]}");
    // DecorationImage _decorationImage = DecorationImage(image: AssetImage(string2AssetImage[title]), fit: BoxFit.cover);
    return Container(
      width: 292,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Image of the card
          // Hero(
          //   tag: myFoodState.getHeroTagRestaurantInCarouselForId(restaurante.id),
          //   child:
            Container(
              width: 292,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(string2AssetImage[title]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
            ),
          //),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: List.generate(5, (index) {
                          return index < rate
                              ? Icon(Icons.star, size: 18, color: Color(0xFFFFB24D))
                              : Icon(Icons.star_border, size: 18, color: Color(0xFFFFB24D));
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),

                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      print('Go to restaurant $title');
                      //Navigator.of(context).pushNamed();
                    },
                    child: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor),
                    color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
