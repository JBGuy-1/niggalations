import 'package:flutter/cupertino.dart';

import 'package:nigg_2/models/global.dart';
import 'package:nigg_2/pages/tips.dart';

import 'package:nigg_2/models/quotecard.dart';
import 'package:nigg_2/pages/quotepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  final String url =
      "https://raw.githubusercontent.com/DEFCON-21/nigga_quotes/main/quotes.json";
  List<Widget> _quoteTiles = [];
  final GlobalKey _listKey = GlobalKey();
  List<Quote> quotes = [];

  loadData() async {
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      String responeBody = response.body;
      var jsonBody = json.decode(responeBody);
      for (var data in jsonBody) {
        quotes
            .add(new Quote(data['quotation'], data['author'], data['number']));
      }
      setState(() {});
      print('sucess');
    } else {
      var errorcode = 'Nigga Check Yo Inanet';
      print(errorcode);
    }

    quotes.forEach((Quote quote) {
      _quoteTiles.add(InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Quotepage(
                quote: quote,
              ),
            ),
          );
        },
        child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(quote.author + ' - ' + quote.number, style: dtitle),
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 80,
                        child: Text(
                          quote.quotation,
                          style: dquote,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Hero(
                    tag: quote.author + quote.number,
                    child: SvgPicture.asset(
                      "images/loader.svg",
                      height: 100,
                    ),
                  ),
                ],
              ),
            )),
      ));
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        //ssdsddsdsdsdsdsdsdsds

        body: _quoteTiles.length == 0
            ? Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      height: 199,
                      child: SvgPicture.asset(
                        'images/loader.svg',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hoolup Nigga...',
                      style: loading,
                    ),
                  ],
                ),
              )
            : Container(
                height: size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: SvgPicture.asset(
                              'images/menu.svg',
                              color: Colors.white,
                            ),
                          ),
                          Text('niggalations', style: titlestyle),
                          Icon(
                            MdiIcons.book,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: closeTopContainer ? 0 : 1,
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: size.width,
                          alignment: Alignment.topCenter,
                          height: closeTopContainer ? 0 : categoryHeight,
                          child: categoriesScroller),
                    ),
                    Expanded(
                        child: ListView.builder(
                            key: _listKey,
                            controller: controller,
                            itemCount: quotes.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              double scale = 1.0;
                              if (topContainer > 0.5) {
                                scale = index + 0.5 - topContainer;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
                              return Opacity(
                                opacity: scale,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..scale(scale, scale),
                                  alignment: Alignment.bottomCenter,
                                  child: Align(
                                      heightFactor: 0.7,
                                      alignment: Alignment.topCenter,
                                      child: _quoteTiles[index]),
                                ),
                              );
                            })),
                  ],
                ),
              ),
      ),
    );
  }
}
