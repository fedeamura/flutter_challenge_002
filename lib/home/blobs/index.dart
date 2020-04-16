import 'package:challenge002/home/blobs/entity.dart';
import 'package:flutter/material.dart';

import 'blob/index.dart';

class Blobs extends StatefulWidget {
  final bool visible;
  final bool blobsVisibles;
  final Function(BlobEntity) onBlobTap;
  final int selectedBlob;

  Blobs({
    this.visible = false,
    this.blobsVisibles = false,
    this.onBlobTap,
    this.selectedBlob,
  });

  @override
  _BlobsState createState() => _BlobsState();
}

class _BlobsState extends State<Blobs> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _drag;

  List<BlobEntity> _blobs = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _drag = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(_animationController);

    _blobs.add(
      BlobEntity()
        ..number = 1
        ..offset = Offset(150, -150)
        ..title = "Cream"
        ..size = Size(200, 200),
    );

    _blobs.add(
      BlobEntity()
        ..number = 2
        ..offset = Offset(-150, -150)
        ..title = "Yogur"
        ..size = Size(200, 200),
    );

    _blobs.add(
      BlobEntity()
        ..number = 3
        ..offset = Offset(0, 0)
        ..title = "Milk"
        ..size = Size(300, 300),
    );

    _blobs.add(
      BlobEntity()
        ..number = 4
        ..offset = Offset(-170, 150)
        ..title = "Cheese"
        ..size = Size(230, 230),
    );

    _blobs.add(
      BlobEntity()
        ..number = 5
        ..offset = Offset(0, 200)
        ..title = "Butter"
        ..size = Size(140, 140),
    );

    _blobs.add(
      BlobEntity()
        ..number = 6
        ..offset = Offset(190, 150)
        ..title = "Buttermilk"
        ..size = Size(240, 240),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Blobs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.blobsVisibles != widget.blobsVisibles) {
      if (widget.blobsVisibles) {
        _animateEnter();
      } else {
        _animateExit();
      }
    }
  }

  _animateEnter() async {
    _animateDrag(Offset.zero);

    _setBlobVisible(3);
    await Future.delayed(Duration(milliseconds: 150));

    _setBlobVisible(1);
    await Future.delayed(Duration(milliseconds: 200));

    _setBlobVisible(2);
    _setBlobVisible(4);
    await Future.delayed(Duration(milliseconds: 150));

    _setBlobVisible(5);
    await Future.delayed(Duration(milliseconds: 100));

    _setBlobVisible(6);
  }

  _setBlobVisible(int number) {
    var blob = _blobs.singleWhere(
      (element) => element.number == number,
      orElse: () => null,
    );
    blob?.visible = true;
    _blobs = List.from(_blobs);
    setState(() {});
  }

  _animateExit() {
    for (var blob in _blobs) {
      blob.visible = false;
    }
    setState(() {
      _blobs = List.from(_blobs);
    });
  }

  _animateDrag(Offset offset, {Duration duration}) {
    _animationController.stop();
    _animationController.duration = duration ?? Duration.zero;

    _drag = Tween<Offset>(
      begin: _drag.value,
      end: offset,
    ).animate(_animationController);

    _animationController.reset();
    _animationController.forward();
  }

  _onBlobTap(BlobEntity blob) {
    _animateDrag(-blob.offset, duration: Duration(milliseconds: 300));
    widget.onBlobTap(blob);
  }

  _isBlobVisible(BlobEntity blob) {
    if (blob.visible == false) return false;
    if (widget.selectedBlob != null && widget.selectedBlob != blob.number) return false;
    return true;
  }

  _isBlobSelected(BlobEntity blob) {
    return widget.selectedBlob == blob.number;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedOpacity(
        opacity: widget.visible ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: GestureDetector(
          onPanUpdate: (_) {
            var dx = _.delta.dx + _drag.value.dx;
            var dy = _.delta.dy + _drag.value.dy;
            _animateDrag(Offset(dx, dy));
          },
          child: Container(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                for (var blob in _blobs)
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (_, Widget child) {
                      return Transform.translate(
                        offset: _drag.value,
                        child: child,
                      );
                    },
                    child: Transform.translate(
                      offset: blob.offset,
                      child: Center(
                        child: Container(
                          width: blob.size.width,
                          height: blob.size.height,
                          child: Blob(
                            visible: _isBlobVisible(blob),
                            selected: _isBlobSelected(blob),
                            onTap: _onBlobTap,
                            blob: blob,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
