import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
      ),
      body: Builder(
        // 새로 context를 만들어서 스낵바를 넣어줘야됨. 안그럼 에러뜸.
        // Scaffold 안에 또 Scaffold를 넣어서 그런것임..
        builder: (context) => Center(
          child: RaisedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('메일이 삭제 되었습니다.'),
                action: SnackBarAction(label: '취소', onPressed: () {
                  // 눌렀을 때 처리
                  // 취소 처리 할 수 있음!!!!
                }),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar'),),
        )
      )
    );
  }
}
