import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class GoToWebBtn extends StatefulWidget{
  GoToWebBtn({Key key, this.url}) : super(key: key);
  final String url;

  @override
  _GoToWebBtnState createState() => _GoToWebBtnState();
}

class _GoToWebBtnState extends State<GoToWebBtn> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.fromLTRB(16,0,16,10),
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        onPressed:(){
          _launchURL(this.widget.url);
        },
        child: Container(
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15)
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: [Colors.blue, Colors.blue[800]]
            )
          ),
          child: Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.language,
                  color: Colors.grey[200],
                ),
                Text(" Go to Website",
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                )
              ]
            )
          ),
        ),
      ),
    );
  }
  void _launchURL(gameUrl) async {
    String url = gameUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}