import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedPaddingExample(),
    );
  }
}

class _AnimatedPaddingExample extends StatefulWidget {
  _AnimatedPaddingExampleState createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<_AnimatedPaddingExample> {

  EdgeInsets _padding = EdgeInsets.zero;

  void _changePadding() {
    setState(() {
      if (_padding.left == 100) {
        _padding = EdgeInsets.only(top: 100, bottom: 100);
      } else {
        _padding = EdgeInsets.only(left: 100, right: 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Padding"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              child: AnimatedPadding(
                padding: _padding,
                curve: Curves.ease,
                duration: Duration(seconds: 1),
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _changePadding();
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