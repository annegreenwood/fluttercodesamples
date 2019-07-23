import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gleebem/src/ui/login.dart';
import 'package:gleebem/src/ui/cadastro.dart';
import 'package:gleebem/src/ui/pageviewer/pageOne.dart';
import 'package:gleebem/src/ui/pageviewer/pageTwo.dart';
import 'package:gleebem/src/ui/pageviewer/pageThree.dart';
import 'package:gleebem/src/ui/pageviewer/pageFour.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

    Widget build(BuildContext context) {
        final dots = new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: new List<Widget>.generate(itemCount, _buildDot),
        );
      
        return dots;
  }
}

class PageViewer extends StatefulWidget {
    @override
    State createState() => new PageViewerState();
}

class PageViewerState extends State<PageViewer> {
    final _controller = new PageController();

    static const _kDuration = const Duration(milliseconds: 300);

    static const _kCurve = Curves.ease;

    final _kArrowColor = Colors.black.withOpacity(0.8);

    final List<Widget> _pages = [PageOne(), PageTwo(), PageThree(), PageFour()];

    @override
    Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(9, 19, 77, 0.8),
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
              itemCount: _pages.length,
            ),
            new Container(
                margin: const EdgeInsets.only(top: 500.0),
                child: new DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                        _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                        );
                    },
                ),
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                //color: Colors.grey[800].withOpacity(0.5),
                width: double.infinity,
                height: 70.0,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Container(
                            width: 200,
                            height: 50,
                            padding: const EdgeInsets.only(top: 16.0),
                            child: new GestureDetector(
                                onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                },
                                child: new Text(
                                    'Login',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0),
                                ),
                            )
                        ),
                        Container(
                            width: 100,
                            height: 50,
                            padding: const EdgeInsets.only(top: 16.0),
                            child: new GestureDetector(
                                onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                                },
                                child: new Text(
                                    'Criar Conta',
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0),
                                ),
                            )
                        ),
                    ],
                )
              ),
            ),
          ],
        ),
      ),
    );
    }
}