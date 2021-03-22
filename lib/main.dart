import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_overlay/test_overlay_turorial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentPage = 0;
  static const List<Color> orange_gradient = [
    Color(0xffF2693d),
    Color(0xffF48763),
    Color(0xffF7A58A),
    Color(0xffFDF0EB),
    Color(0xFFFAF6F4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2693d),
        title: Text("Demo Overlay Tutorial"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: BottomAppBar(
        elevation: 3.0,
        color: Color(0xffF2693d),
        shape: CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    currentPage = 0;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    color: currentPage == 0 ? Colors.white : Color(0xffF2693d),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.home, color: getBottomAppBarColor(0)),
                        Text("Beranda",
                            style: TextStyle(
                                color: getBottomAppBarColor(0),
                                fontSize: 11))
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    color: currentPage == 1 ? Colors.white : Color(0xffF2693d),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.tray_full, color: getBottomAppBarColor(1),),
                        Text("Transaksi",
                            style: TextStyle(
                                color: getBottomAppBarColor(1),
                                fontSize: 11))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,),
                margin: EdgeInsets.only(top: 30),
                width: 55,
                child: Text("Scan",
                    style:
                    TextStyle(color: Colors.white, fontSize: 11)),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    currentPage = 2;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    color: currentPage == 2 ? Colors.white : Color(0xffF2693d),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.question_circle, color: getBottomAppBarColor(2)),
                        Text("Bantuan",
                            style: TextStyle(
                                color: getBottomAppBarColor(2),
                                fontSize: 11))
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    currentPage = 3;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    color: currentPage == 3 ? Colors.white : Color(0xffF2693d),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.person, color: getBottomAppBarColor(3),),
                        Text("Profil",
                            style: TextStyle(
                                color: getBottomAppBarColor(3),
                                fontSize: 11))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: orange_gradient)),
          ),
          SafeArea(
            child: IndexedStack(
              index: currentPage,
              children: <Widget>[
                TestOverlayTutorial(),
                Container(),
                TestOverlayTutorial(),
                Container(
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 15.0,
        focusElevation: 2.0,
        autofocus: false,
        backgroundColor: Color(0xFFFFFFFF),
        child: Icon(Icons.qr_code_scanner,
            color: Color(0xffF2693d), size: 40),
        onPressed: () {
        },
      ),
    );
  }

  Color getBottomAppBarColor(index){
    return currentPage == index ? Color(0xffF2693d) : Colors.white;
  }

}
