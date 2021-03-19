import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:howlongtobeat_app/screens/resultsScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchBoxInput = TextEditingController();
  String searchTerm;
  void initState() {
    super.initState();
    searchTerm = " ";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [Colors.grey[850], Colors.grey[900]]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left:15, right: 15, bottom: 40),
                child:Image.asset('assets/images/hltb_banner.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  autofocus: false,
                  controller: searchBoxInput,
                  onChanged: (text) {
                    if(text != ""){
                      setState(() {
                        searchTerm = text;
                      });
                    }
                  },
                  cursorColor: Colors.grey[200],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 20
                  ),
                  maxLength: 40,
                  decoration: InputDecoration(
                    labelText: 'Game Title',
                    labelStyle: TextStyle(color: Colors.grey[200]),
                    fillColor: Colors.grey[800],
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey[200] ,width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey[200] ,width: 1.0),
                    ),
                  ),
                ),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  primary: Colors.grey[200],
                  side: BorderSide(
                    color: Colors.grey[200]
                  ),
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  String param = searchTerm;
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Results(data: param)),
                  );
                  searchTerm = " ";
                  searchBoxInput.clear();
                    // Respond to button press
                },
                icon: Icon(Icons.search, size: 20),
                label: Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
