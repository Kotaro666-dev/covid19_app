import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class DataModel {
  Future<dynamic> getMyCountryData() async {
    http.Response response =
        await http.get('https://www.stopcovid19.jp/data/covid19japan-all.json');
    String data = response.body;

    if (response.statusCode == 200) {
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getGlobalData() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');
    String data = response.body;

    if (response.statusCode == 200) {
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getGlobalActiveData() async {
    http.Response response = await http
        .get('https://covid19-update-api.herokuapp.com/api/v1/cases/active');
    String data = response.body;

    if (response.statusCode == 200) {
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
