import "package:flutter/material.dart";

class TextInfo extends StatefulWidget{
  TextInfo({Key key, this.gameInfo}) : super(key: key);
  final dynamic gameInfo;//rating number
  
  @override
  _TextInfoState createState() => _TextInfoState();
}

class _TextInfoState extends State<TextInfo> {
  @override
  Widget build(BuildContext context) {
    dynamic data = this.widget.gameInfo;
    if(data.moreInfo == null){
      return Column(
      children: [
        gameInfoField("Description:",data.description),
        ]
      );
    }
    return Column(
      children: [
      Padding(padding: EdgeInsets.only(top:15)),
      gameInfoField("Description:",data.description),
      gameInfoField("Developer:",data.moreInfo['Developer']),
      gameInfoField("Publisher:",data.moreInfo['Publisher']),
      ]
    );
  }


  Widget gameInfoField(String fielLabel, field){
    if(field.toString() != "" && field.toString() != 'null' ){
      return Column(
        children:[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(16,5,0,3),
            child: Text(fielLabel,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(16,0,16,5),
            child: Text(field,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 15),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            endIndent: 15,
            indent: 15,
          ),
        ]
      );
    }
    else{
      return Padding(padding: EdgeInsets.zero);
    }
  }
}