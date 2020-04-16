import 'package:flutter/material.dart';

class MapListItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  MapListItem({
    this.image,
    this.title,
    this.subtitle,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 16.0, bottom: 16.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Whole milk',
                  style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                ),
                Text(
                  'Glass 1/2 galon',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white.withOpacity(0.6)),
                ),
                Text(
                  '\$5.95',
                  style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.yellow.shade100),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    "+",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Container(height: 8.0,),
              Text(
                "0",
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white.withOpacity(0.6), fontSize: 20),
              ),
              Container(height: 8.0,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    "-",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
