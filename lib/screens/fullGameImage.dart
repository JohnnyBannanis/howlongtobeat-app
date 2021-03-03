import 'package:flutter/material.dart';
import 'package:howlongtobeat_app/models/SearchResult.dart';
import 'package:howlongtobeat_app/components/AppBar_hltb.dart';


class GameImage extends StatefulWidget {
  final data;
  const GameImage({Key key, this.data}) : super(key: key);
  @override
  _GameImageState createState() => _GameImageState();
}

class _GameImageState extends State<GameImage> {
  SearchResult item;
  @override
  void initState() {
    super.initState();
    item = this.widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBarHLTB(
        customElevation: 0.0,
        customColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom:70),
        child: Center(
          child: InteractiveViewer(
            maxScale: 4,
            child:Hero(tag: item.gameId, child: Image.network(item.imageUrl,
            )),
          ),
        ),
      ),
    );
  }
}