import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';

class PokeApi {
  final client = http.Client();
  static const String url = "https://pokeapi.co/api/v2/";
  PokeApi();

  Future<List<Pokemon>> getPokemons() async {
    List<Pokemon> list = [];
    List<String> urls = [];
    final response = await client.get(url + "pokemon?limit=100&offset=0");
    final responseList = (json.decode(response.body)["results"] as List);
    responseList.forEach((element) {
      urls.add(element["url"]);
    });

    for(int i = 0; i < urls.length; i++)  {
      final pokemon = await getPokemon(urls[i]);
      print(pokemon.name);
      list.add(pokemon);
    }

    return list;
  }

  Future<Pokemon> getPokemon(String url) async {
    final response = await client.get(url);
//    print(response.body);
//    print(Pokemon.fromJson(json.decode(response.body)).abilities[0].ability.name);
    return Pokemon.fromJson(json.decode(response.body));
  }
}
