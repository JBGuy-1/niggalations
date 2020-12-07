import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
              padding: EdgeInsets.only(top: 150.0, left: 25, right: 25),
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
                ],
              ),
            ),
            Positioned(
              child: Container(),
            )
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
