import 'package:challenge002/home/map/listItem.dart';
import 'package:flutter/material.dart';

class MapContainer extends StatefulWidget {
  final bool visible;
  final Function() onMapTap;
  final bool expanded;

  MapContainer({
    this.visible,
    this.onMapTap,
    this.expanded,
  });

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapContainer> {
  double get _bottomSheetHeight {
    return MediaQuery.of(context).size.height - 200;
  }

  double get _bottomSheetPosition {
    if (widget.expanded) return 200;
    return MediaQuery.of(context).size.height;
  }

  double get _mapHeight {
    if (widget.expanded) return MediaQuery.of(context).size.height - 400;
    return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedOpacity(
        opacity: widget.visible ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: widget.onMapTap,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  height: _mapHeight,
                  color: Colors.black,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
                    child: Image.network(
                      'https://ep01.epimg.net/tecnologia/imagenes/2019/11/13/actualidad/1573658897_566202_1573659544_noticia_normal.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                top: _bottomSheetPosition,
                left: 0,
                right: 0,
                height: _bottomSheetHeight,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 16.0),
                          child: Text(
                            'Products',
                            style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                          ),
                        ),
                        MapListItem(
                          image: '',
                        ),
                        MapListItem(
                          image: '',
                        ),
                        MapListItem(
                          image: '',
                        ),
                        MapListItem(
                          image: '',
                        ),
                        MapListItem(
                          image: '',
                        ),
                        MapListItem(
                          image: '',
                        ),
                      ],
                    ),
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
