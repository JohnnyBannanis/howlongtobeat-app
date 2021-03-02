import "package:flutter/material.dart";

class AppBarHLTB extends StatefulWidget implements PreferredSizeWidget{
  AppBarHLTB({Key key, this.customTitle}) : super(key: key);

  final Widget customTitle;
  final Size preferredSize = Size.fromHeight(60);

  @override
  _AppBarHLTBState createState() => _AppBarHLTBState();
}

class _AppBarHLTBState extends State<AppBarHLTB> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Hero(
        tag: AppBar,
        child: AppBar(
          backgroundColor: Colors.grey[900],
          elevation: 10,
          title: this.widget.customTitle,
          centerTitle: true,
          toolbarHeight: 60,
          leading: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(50,100),
                bottomRight: Radius.elliptical(50,100)
              )
            ),
            child: Icon(Icons.arrow_back,
            color: Colors.grey[200],),
            textColor: Colors.black,
            color: Colors.grey[800],
          ),
        ),
      ),
      preferredSize: AppBar().preferredSize,
    );
  }
}