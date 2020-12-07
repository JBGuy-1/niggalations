import 'package:flutter/material.dart';
import 'package:nigg_2/models/heart.dart';
import 'package:nigg_2/models/quotecard.dart';
import 'package:nigg_2/models/global.dart';
import 'package:random_color/random_color.dart';

class Quotepage extends StatelessWidget {
  final Quote quote;

  Quotepage({@required this.quote});
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    return Material(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: MediaQuery.of(context).size.height / 3,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: _randomColor.randomColor(
                      colorHue: ColorHue.multiple(
                          colorHues: [ColorHue.purple, ColorHue.blue]),
                      colorBrightness: ColorBrightness.light),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.0, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote.quotation,
                    style: dquote,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    quote.author + ' - ' + quote.number,
                    style: dtitle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(2, 0),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Heart(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  Container(
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/nigbannew.jpg'),
//                       fit: BoxFit.fill)),
//             ),
