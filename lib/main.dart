import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedSizeExample(),
    );
  }
}

class _AnimatedSizeExample extends StatefulWidget {
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<_AnimatedSizeExample>
    with SingleTickerProviderStateMixin {

  bool _first = true;

  double _width = 200;
  double _height = 200;

  void _updateSize() {
    setState(() {
      _width = _first ? 220 : 200;
      _height = _first ? 160 : 200;

      _first = !_first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Size"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            child: Center(
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  width: _width,
                  height: _height,
                  color: Colors.blue,
                ),
                vsync: this,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: const Text('CLICK ME!'),
            onPressed: () {
              setState(() {
                _updateSize();
              });
            },
          ),
        ],
      ),
    );
  }
}
