import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/SourcesRes.dart';

abstract class ApiManager {
  static Future loadTabList() async {
    try {
      Uri uri = Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2024-02-21&sortBy=publishedAt&apiKey=32458c86f1774e919360325ebc2162df");
      Response response = await get(uri);

      if(response.statusCode >= 200 && response.statusCode < 300){
        Map mapBody = jsonDecode(response.body);
        SourcesRes.fromJson(mapBody);
      }else{
        throw "something went wrong. please, try again later";
      }
      

    } catch (e) {
      rethrow;
    }
  }
}
