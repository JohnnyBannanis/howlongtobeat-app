import "package:flutter/material.dart";

class ListInfo extends StatefulWidget{
  ListInfo({Key key, this.gameInfo}) : super(key: key);
  final dynamic gameInfo;//rating number
  
  @override
  _ListInfoState createState() => _ListInfoState();
}

class _ListInfoState extends State<ListInfo> {
  @override
  Widget build(BuildContext context) {
    dynamic data = this.widget.gameInfo;
    return Column(
      children: [
      gameListField("Genres:",data.moreInfo['Genres']),
      gameListField("Genre:",data.moreInfo['Genre']),
      gameListField("Platforms:",data.moreInfo['Platforms']),
      ]
    );
  }


  Widget gameListField(String fielLabel, field){
    if(field.toString() != "" && field.toString() != 'null' ){
      List<Widget> output = [];
      output.add(Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(16,5,0,3),
        child: Text(fielLabel,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        )
      ));
      if(field is String){
        Widget aux = ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal:35),
              title: Text(field),
              leading: Icon(Icons.adjust)
            );
          output.add(aux);
      }else{
        field.forEach((element) { 
          Widget aux = ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal:35),
              title: Text(element),
              leading: Icon(Icons.adjust)
            );
          output.add(aux);
        });
      }
      output.add(Divider(
        color: Colors.grey,
        thickness: 1,
        endIndent: 15,
        indent: 15,
      ));
      return Column(
        children: output
      );
    }
    else{
      return Padding(padding: EdgeInsets.zero);
    }
  }
}