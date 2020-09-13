import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedSwitcherExample(),
    );
  }
}

class _AnimatedSwitcherExample extends StatefulWidget {
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState
    extends State<_AnimatedSwitcherExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                // This key causes the AnimatedSwitcher to interpret this as a "new"
                // child each time the count changes, so that it will begin its animation
                // when the count changes.
                style: Theme.of(context).textTheme.headline3,
                key: ValueKey<int>(_count),
              ),
            ),
            RaisedButton(
              child: const Text('Increment'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
