import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 네이티브 코드와 연동하기 위해 MethodChannel 필요!!
/// Android 에서는 FlutterView 를 통해 값 전달
/// iOS 에서는 FlutterViewController 를 통해 값 전달
class MyMethodChannel extends StatefulWidget {
  @override
  _MyMethodChannelState createState() => _MyMethodChannelState();
}

class _MyMethodChannelState extends State<MyMethodChannel> {

  // 메소드 채널 생성 - 안드로이드와 iOS 연동 가능
  static const platform = const MethodChannel('example.com/value');
  // 네이티브에서 가져올 값
  String _value = 'null';
  // 비동기 처리 내부적으로 값 변동
  Future<void> _getNativeValue() async {
    String value;
    // try-catch 문 작성 해줘야됨!!
    try {
      // 네이티브 연동시 getValue 라는 메소드(안드로이드 - 코틀린)를 호출하겠다는 뜻임.
      value = await platform.invokeMethod('getValue');
    } on PlatformException catch(e) {
      value = '네이티브 코드 실행 에러 : ${e.message}';
    }
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MethodChannel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_value'),
            RaisedButton(
              child: Text('네이티브 값 얻기'),
              onPressed: _getNativeValue,
            )
          ],
        ),
      ),
    );
  }
}
