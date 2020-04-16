import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool visible;
  final bool expanded;
  final Function() onSearchTap;

  SearchBar({
    @required this.visible,
    @required this.expanded,
    @required this.onSearchTap,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  double get _iconSearchPosition {
    if (widget.expanded) {
      return 16;
    }

    return MediaQuery.of(context).size.width - 16 - 40;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedOpacity(
        opacity: widget.visible ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: widget.expanded ? 1 : 0,
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 20),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          'Search',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.black.withOpacity(0.6),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: _iconSearchPosition,
                top: 16.0 + MediaQuery.of(context).padding.top,
                child: GestureDetector(
                  onTap: widget.onSearchTap,
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.transparent,
                    child: Icon(Icons.search),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
