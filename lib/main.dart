import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedAlignExample(),
    );
  }
}

class _AnimatedAlignExample extends StatefulWidget {
  _AnimatedAlignExampleState createState() =>
      _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState
    extends State<_AnimatedAlignExample> {
  AlignmentGeometry _alignment = Alignment.topRight;

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Align"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: AnimatedAlign(
                alignment: _alignment,
                curve: Curves.ease,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _changeAlignment();
              },
              child: Text(
                "Click Me!",
              ),
            )
          ],
        ),
      ),
    );
  }
}
