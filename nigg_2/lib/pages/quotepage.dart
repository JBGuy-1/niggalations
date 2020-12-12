import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nigg_2/models/quotecard.dart';
import 'package:nigg_2/models/global.dart';

class Quotepage extends StatelessWidget {
  final Quote quote;

  Quotepage({@required this.quote});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.purpleAccent),
          ),
          Positioned(
            left: 150,
            top: 50,
            child: Hero(
              tag: quote.author + quote.number,
              child: SvgPicture.asset(
                "images/loader.svg",
                //color: Colors.white,
                height: 100,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            bottom: MediaQuery.of(context).size.height / 4,
            child: Container(
              margin: EdgeInsets.only(
                left: 15,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ]),
              padding: EdgeInsets.fromLTRB(20, 20, 20.0, 0),
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Wrap(children: [
                  Text(
                    quote.quotation,
                    style: dquote,
                  ),
                ]),
              ),
            ),
          ),
          Positioned(
            bottom: (MediaQuery.of(context).size.height) / 3.0,
            left: (MediaQuery.of(context).size.width / 2) - 70.0,
            child: Text(
              quote.author + ' - ' + quote.number,
              style: dtitle,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4.5,
            right: MediaQuery.of(context).size.height - 600,
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.closeBox,
                  size: 40,
                ),
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width / 2) - 130.0,
            bottom: (MediaQuery.of(context).size.height) / 2.4,
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ],
      ),
    ));
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
