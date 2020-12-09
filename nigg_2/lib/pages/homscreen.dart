import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nigg_2/pages/tips.dart';
import 'package:nigg_2/pages/chapters.dart';
import 'package:nigg_2/pages/quotelist.dart';
import 'package:nigg_2/models/global.dart';
import 'package:nigg_2/models/quotecard.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: SvgPicture.asset(
                        'images/menu.svg',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'niggalations',
                      style: titlestyle,
                    ),
                    Icon(MdiIcons.book),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Welcome to the church of the hood',
                          style: header,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Have a good day',
                          style: subtexts,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topquotes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          child: Column(
                            children: <Widget>[Tips()],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chapters',
                      style: header,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purpleAccent,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Text('View All'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 120,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topquotes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: <Widget>[Chapters()],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Short Quotes',
                      style: header,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purpleAccent,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Text('View All'),
                      ),
                    )
                  ],
                ),
              ),
              Quotelist(),
            ],
          ),
        ),
      ),
    );
  }
}
