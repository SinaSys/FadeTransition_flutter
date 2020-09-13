import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedDefaultTextStyle(),
    );
  }
}

class _AnimatedDefaultTextStyle extends StatefulWidget {

  _AnimatedDefaultTextStyleState createState() =>
      _AnimatedDefaultTextStyleState();
}

class _AnimatedDefaultTextStyleState
    extends State<_AnimatedDefaultTextStyle> {

  bool _first = true;

  double _fontSize = 60;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Default TextStyle"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 120,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: Text('Flutter'),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _fontSize = _first ? 90 : 60;
                  _color = _first ? Colors.blue : Colors.red;
                  _first = !_first;
                });
              },
              child: Text(
                "CLICK ME!",
              ),
            )
          ],
        ),
      ),
    );
  }
}