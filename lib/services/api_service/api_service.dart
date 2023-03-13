import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon.dart';

class ApiService {
  static const String baseURL =
      'https://webtoon-crawler.nomadcoders.workers.dev';

  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToos() async {
    List<WebtoonModel> webtoonInstancces = [];
    final url = Uri.parse('$baseURL/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        webtoonInstancces.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstancces;
    }
    throw Error();
  }
}
