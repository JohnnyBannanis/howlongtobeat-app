import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:howlongtobeat_app/models/GameInfo.dart";

class GameInfoService {

  //String apiHost = "http://192.168.1.90:5555";
  Future<GameInfo> fetch(String id) async {
    final response = await http.get(Uri.encodeFull('https://hltb-api.herokuapp.com/game_info/'+ id));
    if (response.statusCode == 200) {
      return GameInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load regions');
    }
  }
}