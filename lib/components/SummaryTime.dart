import "package:flutter/material.dart";

class SummaryTime extends StatefulWidget{
  SummaryTime({Key key, this.label, this.unit, this.time}) : super(key: key);

  final String label;
  final String time;
  final String unit;
  

  @override
  _SummaryTimeState createState() => _SummaryTimeState();
}

class _SummaryTimeState extends State<SummaryTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:1, horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [Colors.blue[700], Colors.blue[900]]
            ),
        borderRadius: BorderRadius.all(Radius.circular(7.0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(this.widget.label,
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Expanded(child: SizedBox()),
          Container(width: 8.0),
          Text(this.widget.time,
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(width: 4.0),
          Text(this.widget.unit,
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}