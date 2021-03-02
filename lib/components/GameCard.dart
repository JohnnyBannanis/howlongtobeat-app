import "package:flutter/material.dart";
import 'package:howlongtobeat_app/components/SummaryTime.dart';

class GameCard extends StatefulWidget{
  GameCard({Key key, this.item}) : super(key: key);

  final dynamic item;
  

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        backgroudCard(),
        gameThumbnail(this.widget.item),
        gameCardContent(this.widget.item),
      ],
    );
  }
    Widget errorGameThumbnail(){
    return Container(
      height: 180.0,
      width: 130.0,
      color: Colors.grey[800],
      alignment: FractionalOffset.centerLeft,
    );
  } 

  Widget gameThumbnail(item){
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Hero(
          tag: item.gameId.toString(),
          child: Image.network(item.imageUrl,
            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return errorGameThumbnail();
            },
            height: 180.0,
            width: 130.0,
            fit: BoxFit.cover,
          ),
        ),
      ), 
    );
  } 

  Widget backgroudCard(){
    return Container(
      height: 200.0,
      width: double.maxFinite,
      margin:  EdgeInsets.only(left: 46.0),
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topRight,
          colors: [Colors.grey[600], Colors.grey[800]]
        ),
        shape: BoxShape.rectangle,
        borderRadius:  BorderRadius.circular(8.0),
      ),
    );
  }
  
  Widget gameCardContent(game) {
    double fontSize;
    double endPadding;
    if(game.name.length > 60) { 
      fontSize = 14.6;
      endPadding = 0;
    } 
    else if(game.name.length > 35) { 
      fontSize = 16;
      endPadding = 10.0;
    } else { 
      fontSize = 19.0;
      endPadding = 10.0;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(140.0, 16.0, 15.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(height: 4.0),
          Text(game.name,
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: fontSize,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 3.0,
            width: double.maxFinite,
            color: Colors.grey
          ),
          Expanded(
            child: SizedBox()
          ),
          Column(
            children: [
              SummaryTime(label: game.mainLabel, unit: game.mainUnit, time: game.mainTime),
              Container(
                margin: EdgeInsets.only(bottom:4),
              ),
              SummaryTime(label: game.extraLabel, unit: game.extraUnit, time: game.extraTime),
              Container(
                margin: EdgeInsets.only(bottom:4),
              ),
              SummaryTime(label: game.fullLabel, unit: game.fullUnit, time: game.fullTime),
              Padding(padding: EdgeInsets.only(bottom:endPadding))
            ],
          ),
        ],
      ),
    );
  }
}