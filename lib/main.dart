import 'package:flutter/material.dart';
import 'package:flutter_animatedcontainer/src/my_animated_container.dart';
import 'package:flutter_animatedcontainer/src/my_animated_opacity.dart';
import 'package:flutter_animatedcontainer/src/my_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
              'You have pushed the button this many times:',
            ),
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
            )
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }






}
