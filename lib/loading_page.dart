import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'api.dart';
import 'main_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  DataModel dataModel = DataModel();

  void getAllData() async {
    var globalData = await dataModel.getGlobalData();
    var globalActiveData = await dataModel.getGlobalActiveData();
    var countryData = await dataModel.getMyCountryData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainPage(
        globalData: globalData,
        globalActiveData: globalActiveData,
        countryData: countryData,
      );
    }));
  }

//  void getMyCountryData() async {}

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
