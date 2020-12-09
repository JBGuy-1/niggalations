import 'package:flutter/material.dart';
import 'package:nigg_2/models/global.dart';
import 'package:nigg_2/models/quotecard.dart';

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
            top: MediaQuery.of(context).size.height - 530,
            bottom: MediaQuery.of(context).size.height - 550,
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
              padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: Wrap(children: [
                Text(
                  quote.quotation,
                  style: dquote,
                ),
              ]),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height) - 150.0,
            left: (MediaQuery.of(context).size.width / 2) - 60.0,
            child: Text(
              quote.author + ' - ' + quote.number,
              style: dtitle,
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
