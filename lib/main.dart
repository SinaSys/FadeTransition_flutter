import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedPositionedExample(),
    );
  }
}

class _AnimatedPositionedExample extends StatefulWidget {
  _AnimatedPositionedExampleState createState() => _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<_AnimatedPositionedExample> {

  bool _first = true;

  double _left = 20;
  double _top = 20;
  double _right = 20;
  double _bottom = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Positioned"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  left: _left,
                  top: _top,
                  right: _right,
                  bottom: _bottom,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          RaisedButton(
            child: const Text('CLICK ME!'),
            onPressed: () {
              setState(() {
                _left = _first ? 10 : 20;
                _top = _first ? 70 : 20;
                _right = _first ? 10 : 20;
                _bottom = _first ? 70 : 20;

                _first = !_first;
              });
            },
          ),
        ],
      ),
    );
  }
}