import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
            width: _width,
            height: _height,
            // color 무조건 BoxDecoration 안에 넣어줘야됨!!
            decoration: BoxDecoration(
                color: _color,
                // 가장자리 곡선 정의
                borderRadius: _borderRadius
            ),
            duration: Duration(seconds: 1),
            // 스피드감 추가 다양한기능 도전해 보길!!
            curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(
                random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
            _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    ); 
  }
}
