import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                child: Text("this is container 1"),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: Text("this is container 1"),
              ),
          ]),
        )
      ),
    )
  );
}


