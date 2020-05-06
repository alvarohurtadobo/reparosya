import 'package:flutter/material.dart';

Map<String, String> string2AssetImage = {
  "Conectados SRL"        : "img/electricista.jpeg",
  "Plomeros a domicilio"  : "img/plomero.jpeg",
  "Tu Casa SRL"           : "img/albanil.jpeg",
  "Taller Mecánico Pepe"  : "img/auto.jpeg"};

class ChatItemWidget extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String imgUrl;
  final String date;
  final String time;
  
  ChatItemWidget({Key key, this.name, this.lastMessage, this.imgUrl, this.date, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building carousel for ${string2AssetImage[name]}");
    // DecorationImage _decorationImage = DecorationImage(image: AssetImage(string2AssetImage[name]), fit: BoxFit.cover);
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
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(string2AssetImage[name]),
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
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        lastMessage,
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
                    Text(date,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.display1.apply(fontSizeFactor: 0.4, fontWeightDelta: 3)
                    ),
                    Text(time,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.display1.apply(fontSizeFactor: 0.3)
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
