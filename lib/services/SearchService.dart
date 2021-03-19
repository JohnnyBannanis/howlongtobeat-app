import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:howlongtobeat_app/models/SearchResult.dart";

class SearchService {

  //String apiHost = "http://192.168.1.90:5555";
  static Future<List<SearchResult>> fetch(String query) async {
    final response = await http.get(Uri.encodeFull('https://hltb-api.herokuapp.com/search/'+ query));
    var elem = jsonDecode(response.body);
    Iterable list = elem['HLTB'];
    List gamesFounded = list.map((item) => SearchResult.fromJson(item)).toList();
    if (response.statusCode == 200) {
      return gamesFounded;
    } else {
      throw Exception('Failed to load regions');
    }
  }
}