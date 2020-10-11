import 'package:flutter/material.dart';
import 'constants.dart';

class BigCard extends StatelessWidget {
  BigCard({this.title, this.number, this.bgColor});

  final String title;
  final String number;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  SmallCard({this.title, this.number, this.bgColor});

  final String title;
  final String number;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

class DateFilter extends StatelessWidget {
  DateFilter({this.title, this.color, this.changeFontColor});

  final String title;
  final Color color;
  final Function changeFontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeFontColor,
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
