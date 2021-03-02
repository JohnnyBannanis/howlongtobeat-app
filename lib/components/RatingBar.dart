import "package:flutter/material.dart";

class RatingBar extends StatefulWidget{
  RatingBar({Key key, this.rating}) : super(key: key);

  final String rating;//rating number
  

  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  @override
  
  Widget build(BuildContext context) {
    var numRating;
    if(this.widget.rating != "NR" && this.widget.rating != "null" ){
      numRating = double.parse(this.widget.rating);
    }
    else{
      numRating = 0;
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15,0,16,5),
          child: Row(
            children: [
              Text("Rating:",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17
                ),
              ),
              Expanded(child: SizedBox()),
              Text((numRating).toString() + "%",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17
                ),
              ),
            ],
          ),
        ),
        Stack(
          children:[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal:15),
              height: 20,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                  colors: [Colors.blue, Colors.blue[800]]
                )
              ),
              margin: EdgeInsets.symmetric(horizontal:15),
              height: 20,
              width: ((MediaQuery.of(context).size.width - 40) * (numRating/100)),
            )
          ]
        ),
      ],
    );  
  }
}