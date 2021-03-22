import 'package:flutter/material.dart';
import 'package:overlay_tutorial/overlay_tutorial.dart';
import 'package:flutter/widgets.dart';

class TestOverlayTutorial extends StatefulWidget {
  @override
  _TestOverlayTutorialState createState() => _TestOverlayTutorialState();
}

class _TestOverlayTutorialState extends State<TestOverlayTutorial> with SingleTickerProviderStateMixin{
  final OverlayTutorialController _controller = OverlayTutorialController();
  final
      counterTextKey = GlobalKey(),
      shareKey = GlobalKey(),
      balanceKey = GlobalKey(),
      refreshBalanceKey = GlobalKey(),topUpKey = GlobalKey(),
      transferKey = GlobalKey(),
      transactionFinPayKey = GlobalKey();

  static const List<Color> orange_gradient = [
    Color(0xffF2693d),
    Color(0xffF48763),
    Color(0xffF7A58A),
    Color(0xffFDF0EB),
    Color(0xFFFAF6F4),
  ];

  int _counter = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.showOverlayTutorial();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final textTheme = Theme.of(context).textTheme;
    final tutorialColor = Colors.yellow;
    return SafeArea(
      child: OverlayTutorial(
        context: context,
        controller: _controller,
        overlayTutorialEntries: <OverlayTutorialEntry>[
          // OverlayTutorialRectEntry(
          //   widgetKey: addButtonKey,
          //   padding: const EdgeInsets.all(8.0),
          //   radius: const Radius.circular(16.0),
          //   overlayTutorialHints: <OverlayTutorialWidgetHint>[
          //     OverlayTutorialWidgetHint(
          //       builder: (context, rect, rRect) {
          //         return Positioned(
          //           top: rRect.top - 24.0,
          //           left: rRect.left,
          //           child: Text(
          //             'Try this out',
          //             style: textTheme.bodyText2.copyWith(color: tutorialColor),
          //           ),
          //         );
          //       },
          //     ),
          //     OverlayTutorialWidgetHint(
          //       position: (rect) => Offset(0, rect.center.dy),
          //       builder: (context, rect, rRect) {
          //         return SizedBox(
          //           width: rRect.left,
          //           child: Padding(
          //             padding: const EdgeInsets.only(right: 8.0),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.end,
          //               children: [
          //                 Flexible(
          //                   child: Text(
          //                     'Click here to add counter',
          //                     style: textTheme.bodyText2
          //                         .copyWith(color: tutorialColor),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          OverlayTutorialRectEntry(
            widgetKey: counterTextKey,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            radius: const Radius.circular(16.0),
            overlayTutorialHints: <OverlayTutorialWidgetHint>[
              OverlayTutorialWidgetHint(
                position: (rect) => Offset(0, rect.bottom),
                builder: (context, rect, rRect) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Current Counter will be displayed here',
                          style: textTheme.bodyText2
                              .copyWith(color: tutorialColor),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          OverlayTutorialCustomShapeEntry(
            widgetKey: shareKey,
            shapeBuilder: (rect, path) {
              path = Path.combine(
                PathOperation.difference,
                path,
                Path()
                  ..addOval(Rect.fromLTWH(
                    rect.left - 16,
                    rect.top,
                    112,
                    64,
                  )),
              );
              return path;
            },
          ),
          OverlayTutorialCustomShapeEntry(
            widgetKey: refreshBalanceKey,
            overlayTutorialHints: [],
            shapeBuilder: (rect, path) {
              path = Path.combine(
                PathOperation.difference,
                path,
                Path()
                  ..addOval(Rect.fromLTWH(
                    rect.left - 5,
                    rect.top - 5,
                    SizeConfig.screenWidth * 0.1,
                    SizeConfig.screenWidth * 0.1,
                  )),
              );
              return path;
            },
          ),
          OverlayTutorialCustomShapeEntry(
            widgetKey: balanceKey,
            overlayTutorialHints: [],
            shapeBuilder: (rect, path) {
              path = Path.combine(
                PathOperation.difference,
                path,
                Path()..addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(
                  rect.left,
                  rect.top,
                  SizeConfig.screenWidth * 0.3,
                  35,
                ),Radius.circular(20))),
              );
              return path;
            },
          ),
          OverlayTutorialCustomShapeEntry(
            widgetKey: topUpKey,
            overlayTutorialHints: [],
            shapeBuilder: (rect, path) {
              path = Path.combine(
                PathOperation.difference,
                path,
                Path()
                  ..addOval(Rect.fromLTWH(
                    rect.left - 10,
                    rect.top,
                    SizeConfig.screenWidth * 0.17,
                    SizeConfig.screenWidth * 0.17,
                  )),
              );
              return path;
            },
          ),
          OverlayTutorialCustomShapeEntry(
            widgetKey: transferKey,
            overlayTutorialHints: [],
            shapeBuilder: (rect, path) {
              path = Path.combine(
                PathOperation.difference,
                path,
                Path()
                  ..addOval(Rect.fromLTWH(
                    rect.left - 10,
                    rect.top,
                    SizeConfig.screenWidth * 0.17,
                    SizeConfig.screenWidth * 0.17,
                  )),
              );
              return path;
            },
          ),
          OverlayTutorialCustomShapeEntry(
            widgetKey: transactionFinPayKey,
            overlayTutorialHints: [],
            shapeBuilder: (rect, path) {
              path = Path.combine(
                PathOperation.difference,
                path,
                Path()
                  ..addOval(Rect.fromLTWH(
                    rect.left - 5,
                    rect.top,
                    SizeConfig.screenWidth * 0.17,
                    SizeConfig.screenWidth * 0.17,
                  )),
              );
              return path;
            },
          ),
        ],
        overlayColor: Color(0xff6c6c6c).withOpacity(.6),
        overlayChildren: <Widget>[],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "This is My logo",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          key: balanceKey,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "IDR",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.refresh,
                            key: refreshBalanceKey,
                            color: Colors.white,
                            size: SizeConfig.screenWidth * 0.07,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2.0,
                      margin:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: SizeConfig.screenWidth,
                        padding: const EdgeInsets.all(4.0),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              key: topUpKey,
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  Text(
                                    "Top Up",
                                    style: TextStyle(
                                        color: Color(0xffF2693d),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              key: transferKey,
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.transit_enterexit),
                                  Text(
                                    "Transfer",
                                    style: TextStyle(
                                        color: Color(0xffF2693d),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              key: transactionFinPayKey,
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {},
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.history),
                                  Text(
                                    "Transaksi",
                                    style: TextStyle(
                                        color: Color(0xffF2693d),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.share,
                key: shareKey,
                size: 64,
              ),
              const SizedBox(height: 64),
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                key: counterTextKey,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vestibulum sollicitudin elit ut vehicula. Nullam tellus ligula, ultrices ac nibh quis, lobortis pharetra orci. Proin commodo ante et erat volutpat ornare. Donec ullamcorper quam quis urna finibus bibendum. Nulla tincidunt urna at justo elementum, et ultricies ipsum posuere. Aliquam mattis luctus metus, nec mattis nisl ultrices a. Donec mattis mi eu erat mollis elementum. Nunc vel pulvinar nisi, vitae semper elit. Phasellus porttitor dictum ex in molestie. Aenean tincidunt turpis eget faucibus eleifend.Proin aliquam lectus nec sem mollis finibus. Praesent ante purus, dictum semper auctor et, finibus vel felis. Ut nisl arcu, lobortis a ex sed, sodales vehicula tortor. Phasellus iaculis aliquam felis, vel tristique est vestibulum id. Pellentesque molestie elit sit amet erat elementum, sit amet dapibus est iaculis. Ut eget condimentum tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.Maecenas et felis vitae felis ornare aliquet eu a enim. Phasellus mollis velit a mattis hendrerit. Pellentesque risus ante, aliquet nec tellus venenatis, tempus scelerisque nisl. Duis quis laoreet metus. Suspendisse vel tortor eget ex suscipit hendrerit. Sed viverra elit quis nisi auctor scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus in tellus nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.Nunc id quam et dui sollicitudin iaculis. Ut ut varius augue. Ut elementum consequat bibendum. Integer quis scelerisque mauris. Proin consequat scelerisque sagittis. Vestibulum vulputate malesuada risus quis pellentesque. Aliquam massa magna, commodo eget odio vestibulum, tempor placerat est. Nulla ornare pellentesque nisi sed rhoncus. Integer pellentesque justo id ante blandit laoreet. Vivamus sit amet ex et quam ullamcorper sagittis. Donec dictum lorem risus, vitae ornare ex sagittis quis. Maecenas quis interdum est. Vivamus bibendum diam sit amet sem iaculis lacinia.Sed condimentum quis magna sit amet fermentum. Proin hendrerit, sem ac vehicula vulputate, nulla ex lacinia libero, non imperdiet libero arcu id lorem. Suspendisse lacus sem, pharetra sit amet lacus ac, aliquam pharetra nisl. Nullam risus elit, interdum quis urna ut, laoreet ultrices dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec at rhoncus eros, ut malesuada nisi. Suspendisse lacinia ac massa id iaculis. Fusce suscipit tellus non libero elementum, eget malesuada ante ullamcorper. Nulla suscipit sed lorem sit amet ultrices. Proin aliquet suscipit ultrices. Nullam vehicula suscipit urna, nec imperdiet erat interdum sollicitudin. Duis nec euismod libero. Donec malesuada dolor arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque ac sapien gravida, mattis nisl vel, consequat sem. Donec quis nulla ligula.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    _safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}