import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: _AnimatedList(),
    );
  }
}

class _AnimatedList extends StatefulWidget {

  _AnimatedListState createState() =>
      _AnimatedListState();
}

class _AnimatedListState
    extends State<_AnimatedList> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<String> _items = [];

  Widget _buildItem(BuildContext context, int index, animation) {
    String item = _items[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: ListTile(
        title: Text(item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated List"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              child: AnimatedList(
                key: listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(context, index, animation);
                },
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    listKey.currentState.insertItem(0, duration: const Duration(milliseconds: 500));
                    _items = []
                      ..add(DateTime.now().toIso8601String())
                      ..addAll(_items);
                  });
                },
                child: Text(
                  "Add item to first",
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (_items.length <= 1) return;
                  listKey.currentState.removeItem(
                      0,
                          (_, animation) => _buildItem(context, 0, animation),
                      duration: const Duration(milliseconds: 500)
                  );
                  setState(() {
                    _items.removeAt(0);
                  });
                },
                child: Text(
                  "Remove first item",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}