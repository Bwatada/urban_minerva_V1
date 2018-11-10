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
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: 
              Image.asset(
                'img/titlelogo.png',
                alignment: Alignment(0.0,0.0),
              ),  
            ),
          body: Center(
            child: Text('Scaffold'),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(height: 50.0,),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        )
      )
    );
  }
}