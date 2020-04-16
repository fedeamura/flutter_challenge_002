import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final bool visible;

  Header({
    @required this.visible,
  });

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  double get _position {
    if (widget.visible) return 0.0;
    return -MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: _position,
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Container(
          height: 40 + 16 + 16.0,
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: Center(
                  child: Icon(Icons.menu),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Fresh Milk',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              Opacity(
                opacity: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
