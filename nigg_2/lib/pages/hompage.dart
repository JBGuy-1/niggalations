import 'package:flutter/material.dart';
import 'package:nigg_2/models/quotecard.dart';
import 'package:nigg_2/pages/quotelist.dart';
import 'package:random_color/random_color.dart';
import 'package:nigg_2/models/global.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RandomColor _randomColor = RandomColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'nigglations',
          style: titlestyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to the church of the hood'.toUpperCase(),
                    style: header,
                  ),
                  Text(
                    'Have a nice day',
                    style: subtexts,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              height: 150,
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topquotes.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _randomColor.randomColor(
                          colorHue: ColorHue.multiple(
                              colorHues: [ColorHue.purple, ColorHue.blue]),
                          colorBrightness: ColorBrightness.light),
                    ),
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    child: Column(children: [
                      Wrap(children: [
                        Text(
                          topquotes[index].quota,
                          style: subtexts,
                        ),
                      ]),
                    ]),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.library_books,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Short Verses',
                    style: header,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              height: MediaQuery.of(context).size.height,
              child: Quotelist(),
            )
          ],
        ),
      ),
    );
  }
}
