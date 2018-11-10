import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Bike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        
        body: 
          Padding(
            padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            child: 
            Column(
              children: [
                Image.asset('img/demo.png'),
                Text(
                  "Time Remaining",
                  style: TextStyle( 
                    color: Colors.black,
                    decorationColor: null,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  "59:59",
                  style: TextStyle( 
                    color: Colors.black,
                    decorationColor: null,
                    fontWeight: FontWeight.bold
                  )
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "TOP UP 30 MINUTES",
                    style: TextStyle( 
                      color: Colors.white,
                      decorationColor: null,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "TOP UP 1 HOUR",
                    style: TextStyle( 
                      color: Colors.white,
                      decorationColor: null,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )
        
      )
    );
  }
}