import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';
import 'package:urban_minerva_v1/src/home.dart';
import 'package:urban_minerva_v1/src/map.dart';
import 'package:urban_minerva_v1/src/bike.dart';
import 'package:urban_minerva_v1/src/settings.dart';
import 'package:urban_minerva_v1/src/lock.dart';

// import 'dart:src/hello.dart';
void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  final grey = Color.fromARGB(100,218,218,218);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: DefaultTabController(
        length: 6,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Home(),
              new Map(),
              new Lock(),
              new Bike(),
              new Settings(),
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
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.white,
          ),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
