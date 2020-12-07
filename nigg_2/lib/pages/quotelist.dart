import 'package:flutter/material.dart';
import 'package:nigg_2/models/quotecard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:random_color/random_color.dart';
import 'package:nigg_2/models/global.dart';
import 'package:nigg_2/pages/quotepage.dart';

class Quotelist extends StatefulWidget {
  @override
  _QuotelistState createState() => _QuotelistState();
}

class _QuotelistState extends State<Quotelist> {
  final String url =
      "https://raw.githubusercontent.com/DEFCON-21/nigga_quotes/main/quotes.json";
  List<Widget> _quoteTiles = [];
  final GlobalKey _listKey = GlobalKey();
  List<Quote> quotes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

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
      _quoteTiles.add(_buildTile(quote));
    });
  }

  RandomColor _randomColor = RandomColor();
  Widget _buildTile(Quote quote) {
    return InkWell(
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
        padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: _randomColor.randomColor(
              colorHue: ColorHue.multiple(
                  colorHues: [ColorHue.purple, ColorHue.blue]),
              colorBrightness: ColorBrightness.light),
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
                  '${quote.author}' + '' + '${quote.number}',
                  style: subtexts,
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_right)
              ],
            ),
            Divider(),
            Text(
              quote.quotation,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _quoteTiles.length,
        itemBuilder: (context, index) {
          return _quoteTiles[index];
        });
  }
}
