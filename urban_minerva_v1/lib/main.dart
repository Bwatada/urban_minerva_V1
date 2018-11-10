import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'package:urban_minerva_v1/src/home.dart';
import 'package:urban_minerva_v1/src/map.dart';
import 'package:urban_minerva_v1/src/bike.dart';
import 'package:urban_minerva_v1/src/settings.dart';
import 'package:urban_minerva_v1/src/lock.dart';
// import 'dart:src/hello.dart';
void main(){
  runApp(Main());
}
class Main extends StatelessWidget {
  // This widget is the root of your application.
  final grey = Color.fromARGB(100,218,218,218);

  final Home h = new Home();
  final MapApp ma = new MapApp();
  final Lock l = new Lock();
  final Bike b = new Bike();
  final Settings s = new Settings();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: DefaultTabController(
        length: 6,
        child: new Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: 
              Image.asset(
                'img/titlelogo.png',
                alignment: Alignment(0.0,0.0),
              ),  
            ),
          body: TabBarView(
            children: [
              h, ma, l, b, s,
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.map),
              ),
              Tab(
                icon: new Icon(Icons.vpn_key),
              ),
              Tab(
                icon: new Icon(Icons.directions_bike),
                ),
              Tab(
                icon: new Icon(Icons.settings),
              ),
            ],
            labelColor: Color.fromRGBO(53, 147, 200, 1.0),
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Color.fromRGBO(53, 147, 200, 1.0),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
