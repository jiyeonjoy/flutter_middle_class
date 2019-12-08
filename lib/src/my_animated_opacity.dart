import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  @override
  _MyAnimatedOpacityState createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedOpacity'),
      ),
      body:
        Center(
          // 투명도 조절해주는 애니메이션임!!!!
          child: AnimatedOpacity(
            // _visible true 면 1.0 false 면 0.0
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
      ),
        ),
      floatingActionButton:
      FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          }),
    );
  }
}
