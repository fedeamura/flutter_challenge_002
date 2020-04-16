import 'package:challenge002/home/dashboard/clipper.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final bool visible;

  Dashboard({
    @required this.visible,
  });

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _clipperMultipplier;
  Animation<double> _contentOpacity;

  PageController _pageController;

  double _page = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _clipperMultipplier = Tween<double>(begin: 0.0, end: 0.0).animate(_animationController);
    _contentOpacity = Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);

    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.7,
    );
    _pageController.addListener(() {
      setState(() {
        _page = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Dashboard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.visible != widget.visible) {
      _anim();
    }
  }

  _anim() {
    _animationController.stop();
    _animationController.duration = Duration(milliseconds: 1000);

    _clipperMultipplier = Tween<double>(
      begin: _clipperMultipplier.value,
      end: widget.visible ? 0 : 1,
    ).animate(CurvedAnimation(
      curve: Interval(
        widget.visible ? 0.0 : 0.5,
        widget.visible ? 0.5 : 1.0,
        curve: Curves.ease,
      ),
      parent: _animationController,
    ));

    _contentOpacity = Tween<double>(
      begin: _contentOpacity.value,
      end: widget.visible ? 1 : 0,
    ).animate(CurvedAnimation(
      curve: Interval(
        widget.visible ? 0.5 : 0.0,
        widget.visible ? 1.0 : 0.5,
        curve: Curves.ease,
      ),
      parent: _animationController,
    ));

    _animationController.reset();
    _animationController.forward();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var sizeFactor = (1 - (_page - index).abs() * 0.2);
    var direction = _page - index > 0;
    var offset = (1 - (_page - index).abs() * 50 * (direction ? 1 : -1));

    return Transform.scale(
      scale: sizeFactor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Transform.scale(
            scale: 1.6,
            child: Transform.translate(
              offset: Offset(offset, 0.0),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.grey,
                  BlendMode.saturation,
                ),
                child: Image.network(
                  'https://s3-us-west-2.amazonaws.com/melingoimages/Images/60691.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: Column(
        children: <Widget>[
          Container(
            height: 130,
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (_, Widget child) {
                return ClipPath(
                  clipper: DashboardClipper(multiplier: _clipperMultipplier.value),
                  child: child,
                );
              },
              child: Container(
                color: Colors.black,
                child: AnimatedBuilder(
                  builder: (_, Widget child) {
                    return Opacity(
                      opacity: _contentOpacity.value,
                      child: child,
                    );
                  },
                  animation: _animationController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 130,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                'Featured',
                                style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                              ),
                            ),
                            Text(
                              'All',
                              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Wrap(
                          spacing: 8.0,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Recomended for you',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white.withOpacity(0.4)),
                              ),
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: Colors.white.withOpacity(0.4)),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Most popular',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.white.withOpacity(0.4)),
                              ),
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(color: Colors.white.withOpacity(0.4)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Expanded(
                        child: PageView.builder(
                          itemBuilder: _itemBuilder,
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
