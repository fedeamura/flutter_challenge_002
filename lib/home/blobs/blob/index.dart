import 'dart:async';
import 'dart:math';

import 'package:challenge002/home/blobs/blob/clipper.dart';
import 'package:challenge002/home/blobs/entity.dart';
import 'package:flutter/material.dart';
import 'package:fast_noise/fast_noise.dart';

class Blob extends StatefulWidget {
  final bool visible;
  final BlobEntity blob;
  final Function(BlobEntity) onTap;
  final bool selected;

  Blob({
    this.visible,
    this.blob,
    this.onTap,
    this.selected = false,
  });

  @override
  _BlobState createState() => _BlobState();
}

class _BlobState extends State<Blob> with TickerProviderStateMixin {
  AnimationController _animationController;
  List<Animation<double>> _radius = [];

  AnimationController _animationControllerVisibility;
  Animation<double> _visibilityOpacity;
  Animation<double> _visibilityScale;

  AnimationController _animationControllerSelected;
  Animation<double> _selectedScale;
  Animation<double> _selectedContentOpacity;
  Animation<Color> _selectedColor;

  Timer _timer;

  int get _length => 50;

  Duration get _duration => Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    for (int i = 0; i < _length; i++) {
      _radius.add(Tween<double>(begin: 0.0, end: 1.0).animate(_animationController));
    }

    _animationControllerVisibility = AnimationController(vsync: this);
    _visibilityOpacity = Tween<double>(
      begin: widget.visible ? 1 : 0,
      end: widget.visible ? 1 : 0,
    ).animate(_animationControllerVisibility);

    _visibilityScale = Tween<double>(
      begin: widget.visible ? 1 : 0,
      end: widget.visible ? 1 : 0,
    ).animate(_animationControllerVisibility);

    _animationControllerSelected = AnimationController(vsync: this);
    _selectedScale = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(_animationControllerSelected);
    _selectedColor = ColorTween(
      begin: Colors.black,
      end: Colors.black,
    ).animate(_animationControllerSelected);
    _selectedContentOpacity = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(_animationControllerSelected);

    _change();
    _change(duration: _duration);
    _initTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Blob oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.visible != widget.visible) {
      _animateVisibility(widget.visible, duration: Duration(milliseconds: 500));
    }

    if (oldWidget.selected != widget.selected) {
      _animateSelected(widget.selected, duration: Duration(milliseconds: 1000));
    }
  }

  _initTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_duration, (timer) {
      _change(duration: _duration);
    });
  }

  _change({Duration duration}) {
    _animationController.stop();
    _animationController.duration = duration ?? Duration.zero;

    var arr2d = noise2(
      _length,
      1,
      noiseType: NoiseType.Perlin,
      octaves: 1,
      frequency: 0.1,
      seed: Random().nextInt(100000),
    );

    var newAnims = [];
    for (int i = 0; i < _length; i++) {
      var anim = _radius[i];
      var v = mapValue(arr2d[i][0], -1, 1, 0.4, 1);
      newAnims.add(Tween<double>(begin: anim.value, end: v).animate(_animationController));
    }
    _radius = List.from(newAnims);

    _animationController.reset();
    _animationController.forward();
  }

  _animateVisibility(bool visible, {Duration duration}) {
    _animationControllerVisibility.stop();
    _animationControllerVisibility.duration = duration ?? Duration.zero;

    _visibilityScale = Tween<double>(
      begin: _visibilityScale.value,
      end: visible ? 1 : 0,
    ).animate(_animationControllerVisibility);

    _visibilityOpacity = Tween<double>(
      begin: _visibilityOpacity.value,
      end: visible ? 1 : 0,
    ).animate(_animationControllerVisibility);

    _animationControllerVisibility.reset();
    _animationControllerVisibility.forward();
  }

  _animateSelected(bool selected, {Duration duration}) {
    _animationControllerSelected.stop();
    _animationControllerSelected.duration = duration ?? Duration.zero;

    _selectedScale = Tween<double>(
      begin: _selectedScale.value,
      end: selected ? 10 : 1,
    ).animate(CurvedAnimation(
      curve: Interval(
        0,
        1,
        curve: Curves.ease,
      ),
      parent: _animationControllerSelected,
    ));

    _selectedColor = ColorTween(
      begin: _selectedColor.value,
      end: selected ? Colors.white : Colors.black,
    ).animate(CurvedAnimation(
      curve: Interval(
        selected ? 0.5 : 0.0,
        selected ? 1.0 : 0.5,
        curve: Curves.ease,
      ),
      parent: _animationControllerSelected,
    ));

    _selectedContentOpacity = Tween<double>(
      begin: _selectedContentOpacity.value,
      end: selected ? 0.0 : 1.0,
    ).animate(CurvedAnimation(
      curve: Interval(
        selected ? 0.0 : 0.5,
        selected ? 0.5 : 1.0,
        curve: Curves.ease,
      ),
      parent: _animationControllerSelected,
    ));
    _animationControllerSelected.reset();
    _animationControllerSelected.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationControllerSelected,
      builder: (_, Widget child) {
        return Transform.scale(
          scale: _selectedScale.value,
          child: child,
        );
      },
      child: AnimatedBuilder(
        animation: _animationControllerVisibility,
        builder: (_, Widget child) {
          return Transform.scale(
            scale: _visibilityScale.value,
            child: Opacity(
              opacity: _visibilityOpacity.value,
              child: child,
            ),
          );
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, Widget child) {
            List<double> data = [];
            for (var anim in _radius) {
              data.add(anim.value);
            }
            return ClipPath(
              clipper: BlobClipper(radius: data),
              child: child,
            );
          },
          child: GestureDetector(
            onTap: () {
              widget.onTap(widget.blob);
            },
            child: AnimatedBuilder(
              animation: _animationControllerSelected,
              builder: (_, Widget child) {
                return Container(
                  color: _selectedColor.value,
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: _animationControllerSelected,
                builder: (_, Widget child) {
                  return Opacity(
                    opacity: _selectedContentOpacity.value,
                    child: child,
                  );
                },
                child: Center(
                  child: LayoutBuilder(
                    builder: (_, constrains) => Text(widget.blob.title,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontSize: constrains.maxWidth * 0.1,
                            )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mapValue(double input, double input_start, double input_end, double output_start, double output_end) {
  return output_start + ((output_end - output_start) / (input_end - input_start)) * (input - input_start);
}
