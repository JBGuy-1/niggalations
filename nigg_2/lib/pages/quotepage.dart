import 'package:flutter/material.dart';
import 'package:nigg_2/models/quotecard.dart';

import 'package:nigg_2/models/global.dart';

class Quotepage extends StatefulWidget {
  @override
  _QuotepageState createState() => _QuotepageState();
}

class _QuotepageState extends State<Quotepage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.purple,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white),
              ),
            )
          ],
        )
      ],
    );
  }
}
