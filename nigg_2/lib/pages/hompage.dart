import 'package:flutter/material.dart';
import 'package:nigg_2/models/quotecard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nigg_2/models/global.dart';
import 'package:random_color/random_color.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String url =
      "https://raw.githubusercontent.com/DEFCON-21/nigga_quotes/main/quotes.json";

  List<Quote> quotes = [];

  @override

  void initState() {
    loadData();

  }
  loadData() async {
    var response = await http.get(url, headers: {"Aceept": "application/json"});
    if (response.statusCode == 200) {
      String responeBody = response.body;
      var jsonBody = json.decode(responeBody);
      for (var data in jsonBody) {
        quotes.add(new Quote(
            data['quotation'], data['author'], data['number']));
      }
      setState(() {});
      quotes.forEach((someData) => print("Name : ${someData.number}"));
    } else {
      print('Something went wrong');
    }
  }

  RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
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
                      color:_randomColor.randomColor(
                          colorHue: ColorHue.multiple(
                              colorHues: [ColorHue.purple, ColorHue.blue]),
                          colorBrightness: ColorBrightness.light
                      ) ,
                    ),
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    child: Column(children: [
                      Wrap(
                        children: [
                          Wrap(children: [
                            Text(
                              topquotes[index].quota,
                              style: subtexts,
                            ),
                          ]),
                        ],
                      ),
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        margin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          color: _randomColor.randomColor(
                              colorHue: ColorHue.multiple(
                                  colorHues: [ColorHue.purple, ColorHue.blue])),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.library_books),
                                Spacer(),
                                Text(
                                  '${quotes[index].author}' +
                                      '' +
                                      '${quotes[index].number.toString()}',
                                  style: subtexts,
                                ),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                            Divider(),
                            Text(
                              '${quotes[index].quotation}',
                              style: subtexts,
                            ),
                            Divider(),
                            Row(
                              children: [
                                Icon(Icons.favorite_border),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
  );
  }
}
