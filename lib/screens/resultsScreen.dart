import 'package:flutter/material.dart';
import 'package:howlongtobeat_app/components/GameCard.dart';
import 'package:howlongtobeat_app/models/SearchResult.dart';
import 'package:howlongtobeat_app/services/SearchService.dart';
import 'package:howlongtobeat_app/screens/gameDetail.dart';
import "package:howlongtobeat_app/components/AppBar_hltb.dart";

class Results extends StatefulWidget {
  final data;
  const Results({Key key, this.data}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  Future<List<SearchResult>> futureResult;

  @override
  void initState() {
    super.initState();
    futureResult = SearchService.fetch(this.widget.data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHLTB(
        customColor: Colors.grey[900],
        customElevation: 10.0,
        customTitle: Image.asset('assets/images/hltb_brand.png', 
          fit:BoxFit.contain, 
          height: 70,),
      ),
      backgroundColor: Colors.grey[850],
      body: Container(
        child: FutureBuilder(
          future: futureResult,
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(top:14),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var item = snapshot.data[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => GameDetail(data: item,)));
                  },
                  child: Container(
                    height: 200.0,
                    margin: const EdgeInsets.fromLTRB(14,0,14,15),
                    child: GameCard(
                      item: item,
                    )
                  )
                );
              }
            ); 

            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(child: CircularProgressIndicator())
            );
          },
        )
      ),
    );
  }

}