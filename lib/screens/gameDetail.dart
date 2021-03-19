import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:howlongtobeat_app/components/BigSummaryTime.dart';
import 'package:howlongtobeat_app/components/GoToWebBtn.dart';
import 'package:howlongtobeat_app/components/ListInfo.dart';
import 'package:howlongtobeat_app/components/RatingBar.dart';
import 'package:howlongtobeat_app/components/TextInfo.dart';
import 'package:howlongtobeat_app/models/GameInfo.dart';
import 'package:howlongtobeat_app/models/SearchResult.dart';
import 'package:howlongtobeat_app/services/GameInfoService.dart';
import 'package:howlongtobeat_app/components/AppBar_hltb.dart';
import "package:howlongtobeat_app/screens/fullGameImage.dart";


class GameDetail extends StatefulWidget {
  final data;
  const GameDetail({Key key, this.data}) : super(key: key);
  
  @override
  _GameDetailState createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  Future<GameInfo> futureResult;
  SearchResult item;

  @override
  void initState() {
    super.initState();
    item = this.widget.data;
    futureResult = GameInfoService().fetch(item.gameId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBarHLTB(
        customColor: Colors.grey[900],
        customElevation: 10.0,
        customTitle: Image.asset('assets/images/hltb_banner.png', 
          fit:BoxFit.contain, 
          height: 32.5),
      ),
      body: Stack(
        children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item.imageUrl),
              fit: BoxFit.fitHeight
              )
            ),
          child:  BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child:  Container(
              decoration:  BoxDecoration(color: Colors.black.withOpacity(0.4))
            ),
          ),
        ),

        GestureDetector(
          onTap: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => GameImage(data: item,)));
          },
          child: Container(
            padding: EdgeInsets.only(bottom:85),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
            child: Hero(
              tag: item.gameId, 
              child: Image.network(item.imageUrl,
                fit: BoxFit.fitWidth,          
              ),
            ),
          ),
        ),

        DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.35,
          maxChildSize: 0.75,
          builder: (context, scrollController){
            return Container(
              child: ListView(
                controller: scrollController,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:5),
                    child: Center(
                      child:Icon(Icons.menu,
                      color: Colors.grey[700],
                      size: 18,
                      )
                    )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(item.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BigSummaryTime(time: item.mainTime, unit: item.mainUnit, label: item.mainLabel),
                        BigSummaryTime(time: item.extraTime, unit: item.extraUnit, label: item.extraLabel),
                        BigSummaryTime(time: item.fullTime, unit: item.fullUnit, label: item.fullLabel)
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: futureResult,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var gameData = snapshot.data;
                        return Column(
                          children: [
                            RatingBar( rating: gameData.rating),
                            TextInfo( gameInfo: gameData),
                            ListInfo( gameInfo: gameData),
                            GoToWebBtn( url: gameData.webLink)
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Container(
                        margin: EdgeInsets.only(top:10),
                        child: Center(child: CircularProgressIndicator())
                      );
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.grey[300].withOpacity(0.95),
              ),
            );
          },
        )]
      ),
    );
  }
}