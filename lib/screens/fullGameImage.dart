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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          
              child: InteractiveViewer(

                child:Hero(
                  tag: item.gameId,
                  child: Image.network(item.imageUrl, fit: BoxFit.fitWidth,)
                ),
              ),
          ),
          SizedBox(
            height: 60,
            child: AppBarHLTB(
              customElevation: 0,
              customColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}