import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../constants.dart';
import '../models/Team.dart';

class APIService {
  static Future<List<Team>> fetchTeams({skip, limit = 20}) async {
    var url =
        Constants.TANZI_API_URL + "/team" + (skip != 0 ? "?skip=$skip" : "");

    final response = await http.Client().get(url);
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Team>((json) => Team.formJson(json)).toList();
  }
}
