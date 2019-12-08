import 'package:flutter/material.dart';

class MyTabController extends StatefulWidget {
  @override
  _MyTabControllerState createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabController'),
          bottom: TabBar(tabs: [
            // 이미지 글자 같이 넣을시 Tab 안에 넣어주고
            // 글자만 넣을 경우 Text 안에 넣어주면 됨!!
            Tab(icon: Icon(Icons.access_alarm), text: 'Tab1',),
            Text('Tab2'),
            Text('Tab3')
          ]),
        ),
        body: TabBarView(children: <Widget>[
          // Icon 은 자동으로 센터에 놓임
          Icon(Icons.access_alarm),
          Center(child: Text('Tab2')),
          Text('Tab3'),
        ],),
      ),
      length: 3,
    );
  }
}
