import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../constants.dart';
import '../models/NewsItem.dart';

class APIService {
  static Future<List<NewsItem>> getNews({page = 1, limit = 10}) async {
    var url = Constants.url + "/data/all/$limit/$page";

    final response = await http.Client().get(url);
    final parsed = json.decode(response.body);

    return parsed['results']
        .map<NewsItem>((json) => NewsItem.formJson(json))
        .toList();
  }
}
