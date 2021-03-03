import "package:flutter/material.dart";

class AppBarHLTB extends StatefulWidget implements PreferredSizeWidget{
  AppBarHLTB({Key key, this.customTitle, this.customColor, this.customElevation}) : super(key: key);

  final Widget customTitle;
  final Color customColor;//grey[900]
  final double customElevation;//10
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
          backgroundColor: this.widget.customColor,
          elevation: this.widget.customElevation,
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