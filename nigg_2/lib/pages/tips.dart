import 'package:flutter/material.dart';
import 'package:nigg_2/models/global.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            'Nigga tip',
            style: header,
          ),
          Text(
            'Tip number',
            style: subtexts,
          ),
        ],
      ),
    );
  }
}
