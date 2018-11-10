import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Image.asset('img/logo.png'),
          ],
      ),
    // decoration: BoxDecoration(
    //   image: DecorationImage(
    //     image: AssetImage('img/logo.png'),
    //     // ...
    //   ),
    //   // ...
    // ),
  );
  }
}