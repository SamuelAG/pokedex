import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class PokeApi {
  final client = http.Client();
  static const String url = "https://gist.githubusercontent.com/mrcsxsiq/b94dbe9ab67147b642baa9109ce16e44/raw/97811a5df2df7304b5bc4fbb9ee018a0339b8a38/";
  PokeApi();

  Future<List<Pokemon>> getList() async {
    final response = await client.get(url);
    var list = (json.decode(response.body) as List)
        .map((data) => Pokemon.fromJson(data))
        .toList();
    return list;
  }


}
