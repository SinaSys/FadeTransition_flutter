import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FadeTransitionExampleState(),
    );
  }
}

class FadeTransitionExampleState extends StatefulWidget {
  @override
  _FadeTransitionExampleStateState createState() =>
      _FadeTransitionExampleStateState();
}

class _FadeTransitionExampleStateState extends State<FadeTransitionExampleState>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Tutorial'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Text(
              'Flutter',
              style: TextStyle(color: Colors.teal, fontSize: 50),
            ),
          ),
        ),
      ),
    );
  }
}
