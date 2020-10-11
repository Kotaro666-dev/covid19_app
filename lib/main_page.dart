import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reusable_widget.dart';
import 'update_numbers.dart';

String affectedNumber;
String deathNumber;
String recoveredNumber;
String activeNumber;
String seriousNumber;

bool japanMode = true;
bool globalMode = false;
bool totalMode = true;
bool todayMode = false;
bool yesterdayMode = false;

void whichCountryIsOn(bool country) {
  if (country == japanMode) {
    japanMode = true;
    globalMode = false;
  } else {
    japanMode = false;
    globalMode = true;
  }
}

void whichModeIsOn(String mode) {
  if (mode == 'total') {
    totalMode = true;
    todayMode = false;
    yesterdayMode = false;
  } else if (mode == 'today') {
    totalMode = false;
    todayMode = true;
    yesterdayMode = false;
  } else if (mode == 'yesterday') {
    totalMode = false;
    todayMode = false;
    yesterdayMode = true;
  }
}

class MainPage extends StatefulWidget {
  MainPage({this.globalData, this.globalActiveData, this.countryData});
  final globalData;
  final globalActiveData;
  final countryData;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalTotalNumbers globalTotalNumbers = GlobalTotalNumbers();
  CountryTotalNumber countryTotalNumber = CountryTotalNumber();
  CountryTodayNumber countryTodayNumber = CountryTodayNumber();
  CountryDayAfterNumber countryDayAfterNumber = CountryDayAfterNumber();

  Color totalFontColor = Colors.white;
  Color todayFontColor = Colors.grey;
  Color yesterdayFontColor = Colors.grey;
  Color myCountryFontColor = Colors.black;
  Color globalFontColor = Colors.white;
  Color myCountryBtnColor = Colors.white;
  Color globalBtnColor = kBarBGColor;

  void changeFontColor(String mode) {
    if (mode == 'total') {
      totalFontColor = Colors.white;
      todayFontColor = Colors.grey;
      yesterdayFontColor = Colors.grey;
    } else if (mode == 'today') {
      totalFontColor = Colors.grey;
      todayFontColor = Colors.white;
      yesterdayFontColor = Colors.grey;
    } else if (mode == 'yesterday') {
      totalFontColor = Colors.grey;
      todayFontColor = Colors.grey;
      yesterdayFontColor = Colors.white;
    }
  }

  void swipeButton(int num) {
    if (num == 0) {
      myCountryBtnColor = Colors.white;
      globalBtnColor = kBarBGColor;
      myCountryFontColor = Colors.black;
      globalFontColor = Colors.white;
    } else {
      myCountryBtnColor = kBarBGColor;
      globalBtnColor = Colors.white;
      myCountryFontColor = Colors.white;
      globalFontColor = Colors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    // 初期状態の画面
    countryTotalNumber.updateCountryTotal(widget.countryData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryBGColor,
        appBar: AppBar(
          backgroundColor: kPrimaryBGColor,
          elevation: 0.0,
          leading: Icon(
            FontAwesomeIcons.bars,
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.bell),
              alignment: Alignment.centerLeft,
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Statistics',
                    style: kStatisticsTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kBarBGColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            color: myCountryBtnColor,
                            textColor: myCountryFontColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              'Japan',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                swipeButton(0);
                                changeFontColor('total');
                                whichCountryIsOn(japanMode);
                                whichModeIsOn('total');
                                countryTotalNumber
                                    .updateCountryTotal(widget.countryData);
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            color: globalBtnColor,
                            textColor: globalFontColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'Global',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                swipeButton(1);
                                changeFontColor('total');
                                whichCountryIsOn(globalMode);
                                whichModeIsOn('total');
                                globalTotalNumbers.updateGlobalTotal(
                                    widget.globalData, widget.globalActiveData);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DateFilter(
                      title: 'Total',
                      color: totalFontColor,
                      changeFontColor: () {
                        setState(() {
                          whichModeIsOn('total');
                          changeFontColor('total');
                          if (japanMode == true) {
                            countryTotalNumber
                                .updateCountryTotal(widget.countryData);
                          } else {
                            globalTotalNumbers.updateGlobalTotal(
                                widget.globalData, widget.globalActiveData);
                          }
                        });
                      },
                    ),
                    DateFilter(
                      title: 'Today',
                      color: todayFontColor,
                      changeFontColor: () {
                        setState(() {
                          whichModeIsOn('today');
                          changeFontColor('today');
                          if (japanMode == true) {
                            countryTodayNumber
                                .updateCountryToday(widget.countryData);
                          } else {
                            //
                          }
                        });
                      },
                    ),
                    DateFilter(
                      title: 'Yesterday',
                      color: yesterdayFontColor,
                      changeFontColor: () {
                        setState(() {
                          whichModeIsOn('yesterday');
                          changeFontColor('yesterday');
                          if (japanMode == true) {
                            countryDayAfterNumber
                                .updateCountryDayAfter(widget.countryData);
                          } else {
                            //
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BigCard(
                        title: 'Affected',
                        number: affectedNumber,
                        bgColor: kAffectedColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: BigCard(
                        title: 'Death',
                        number: deathNumber,
                        bgColor: kDeathColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SmallCard(
                        title: 'Recovered',
                        number: recoveredNumber,
                        bgColor: kRecoveredColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: SmallCard(
                        title: 'Active',
                        number: activeNumber,
                        bgColor: kActiveColor,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: SmallCard(
                        title: 'Serious',
                        number: seriousNumber,
                        bgColor: kSeriousColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // THIS SECTION IS PLANNED FOR　FUTURE GRAPH PART
            // Expanded(
            //   flex: 4,
            //   child: Container(
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(35.0),
            //         topRight: Radius.circular(35.0),
            //       ),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: 20.0, vertical: 20.0),
            //       child: Column(
            //         children: <Widget>[
            //           Align(
            //             alignment: Alignment.centerLeft,
            //             child: Text(
            //               'Daily New Cases',
            //               style: TextStyle(
            //                 fontSize: 25.0,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
