import 'package:flutter/material.dart';
import 'package:nigg_2/models/global.dart';

class Chapters extends StatefulWidget {
  @override
  _ChaptersState createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0,
          ),
        ],
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
