import 'package:flutter/material.dart';

Map<String, String> string2AssetImage = {
  "Conectados SRL"        : "img/electricista.jpeg",
  "Plomeros a domicilio"  : "img/plomero.jpeg",
  "Tu Casa SRL"           : "img/albanil.jpeg",
  "Taller Mecánico Pepe"  : "img/auto.jpeg"};

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;
  final double rate;
  final String status;
  final String action;
  
  CategoryItemWidget({Key key, this.title, this.subtitle, this.imgUrl, this.rate, this.status, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building carousel for ${string2AssetImage[title]}");
    // DecorationImage _decorationImage = DecorationImage(image: AssetImage(string2AssetImage[title]), fit: BoxFit.cover);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        boxShadow: [
          BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Hero(
          //   tag: myFoodState.getHeroTagRestaurantInMenuForId(restaurante.id),
          //   child: 
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: AssetImage(string2AssetImage[title]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          //),
          SizedBox(width: 15),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: List.generate(5, (index) {
                          return index < rate
                              ? Icon(Icons.star, size: 18, color: Color(0xFFFFB24D))
                              : Icon(Icons.star_border, size: 18, color: Color(0xFFFFB24D));
                        }),
                      ),
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(status,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.display1.apply(color: (status == "Abierto")?Colors.green:Colors.red,fontSizeFactor: 0.7)
                    ),
                    Text(action,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.display1.apply(fontSizeFactor: 0.5)
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
