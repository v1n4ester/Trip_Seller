import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trip_seller/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    try {
      http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
      if(res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
