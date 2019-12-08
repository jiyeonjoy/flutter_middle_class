import 'package:flutter/material.dart';
import 'package:flutter_animatedcontainer/src/my_animated_container.dart';
import 'package:flutter_animatedcontainer/src/my_animated_opacity.dart';
import 'package:flutter_animatedcontainer/src/my_drawer.dart';
import 'package:flutter_animatedcontainer/src/my_form_validation.dart';
import 'package:flutter_animatedcontainer/src/my_orientation.dart';
import 'package:flutter_animatedcontainer/src/my_snack_bar.dart';
import 'package:flutter_animatedcontainer/src/my_swipe_to_dismiss.dart';
import 'package:flutter_animatedcontainer/src/my_tab_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 테마 색상 변경 가능.
        // primarySwatch: Colors.yellow,
        // brightness: Brightness.dark,
        primaryColor: Colors.green,
        // 플로팅 버튼 색
        accentColor: Colors.yellow
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            // 머티리얼 버튼임!!!!
            RaisedButton(
                child: Text('MyAnimatedContainer'), 
                onPressed: _goMyAnimatedContainer
            ),
            // 머티리얼 버튼임!!!!
            RaisedButton(
                child: Text('MyAnimatedOpacity'),
                onPressed: _goMyAnimatedOpacity
            ),
            RaisedButton(
                child: Text('MyDrawer'),
                onPressed: _goMyDrawer
            ),
            RaisedButton(
                child: Text('MySnackBar'),
                onPressed: _goMySnackBar
            ),
            RaisedButton(
                child: Text('MyOrientation'),
                onPressed: _goMyOrientation
            ),
            RaisedButton(
                child: Text('MyTabController'),
                onPressed: _goMyTabController
            ),
            RaisedButton(
                child: Text('MyFormValidation'),
                onPressed: _goMyFormValidation
            ),
            RaisedButton(
                child: Text('MySwipeToDismiss'),
                onPressed: _goMySwipeToDismiss
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _goMyAnimatedContainer() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MyAnimatedContainer()));
  }

  void _goMyAnimatedOpacity() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MyAnimatedOpacity()));
  }

  void _goMyDrawer() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MyDrawer()));
  }

  void _goMySnackBar() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MySnackBar()));
  }

  void _goMyOrientation() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MyOrientation()));
  }

  void _goMyTabController() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MyTabController()));
  }

  void _goMyFormValidation() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MyFormValidation()));
  }

  void _goMySwipeToDismiss() {
    Navigator.push(context,
        MaterialPageRoute(builder: (counter) => MySwipeToDismiss()));
  }
}
