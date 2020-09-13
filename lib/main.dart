import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedPhysicalModel(),
    );
  }
}

class _AnimatedPhysicalModel extends StatefulWidget {

  _AnimatedPhysicalModelState createState() =>
      _AnimatedPhysicalModelState();
}

class _AnimatedPhysicalModelState
    extends State<_AnimatedPhysicalModel> {

  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Physical Model"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              child: const Text('Click Me!'),
              onPressed: () {
                setState(() {
                  _first = !_first;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}