import 'package:flutter/material.dart';
import 'quotes.dart';
import 'background.dart';

class PageTwo extends StatelessWidget {
  PageTwo({Key key}) : super(key: key);

  final Quote quoteObj = quotes[1];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ApplyBackground(quoteObj.imageURL),
          Container(
            width: 400.0,
            padding: EdgeInsets.only(
              left: 36.0,
              right: 36.0,
              top: 60.0,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                    child: Text(
                      quoteObj.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                    Text(
                        quoteObj.quote,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 100.0),
                    SizedBox(
                      height: 170.0, child: Image.asset('assets/page_viewer_1.png')
                    ),
                ]),
          )
        ],
      ),
    );
  }
}