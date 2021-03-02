import "package:flutter/material.dart";

class BigSummaryTime extends StatefulWidget{
  BigSummaryTime({Key key, this.label, this.unit, this.time}) : super(key: key);

  final String label;
  final String time;
  final String unit;
  

  @override
  _BigSummaryTimeState createState() => _BigSummaryTimeState();
}

class _BigSummaryTimeState extends State<BigSummaryTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom:3),
          width: 110,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20)
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.blue[800]]
            )
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom:3)),
              Text(this.widget.time,
                style: TextStyle(
                  color: Colors.grey[50],
                  fontWeight: FontWeight.w900,
                  fontSize: 26
                ),
              ),
              Text(this.widget.unit,
              style: TextStyle(
                  color: Colors.grey[50],
                  fontWeight: FontWeight.w900,
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
        Text(this.widget.label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        )]
    );
  }
}