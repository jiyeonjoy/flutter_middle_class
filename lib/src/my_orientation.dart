import 'package:flutter/material.dart';

class MyOrientation extends StatefulWidget {
  @override
  _MyOrientationState createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationBuilder'),
      ),
      body: OrientationBuilder(
        // Orientation orientation 화면 방향
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
              // Orientation.portrait 화면방향이 세로면 3 아니면(가로) 5
              crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
              // GridView 50개 자동생성
              children: List.generate(50, (position) {
                return Center(
                  child: Text('Item $position'),
                );
              })
          );
        },
      ),
    );
  }
}
