import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // 네비게이션 바 위에 상태바 색상 추가됨.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // 할 일 작성
                // 네비게이션 바 닫기
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // 할 일 작성
                // 네비게이션 바 닫기
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                // 할 일 작성
                // 네비게이션 바 닫기
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      body: Center(
        child: Text('Drawer 예제'),
      ),
    );
  }
}
