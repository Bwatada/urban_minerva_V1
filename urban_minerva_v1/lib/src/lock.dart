import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Lock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Container(
        color: Colors.white,
        child: Scaffold(
          body: Center(
            child: Text('Will be Lock Widget'),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(height: 50.0,),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.lock),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        )
      )
    );
  }
}