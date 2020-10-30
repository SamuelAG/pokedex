import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pokemon.dart';
import '../models/types.dart';

class PokeApi {
  final client = http.Client();
  static const String url = "https://pokeapi.co/api/v2/";
  PokeApi();

  Future<List<PokemonListView>> getList() async {
    final response = await client.get(url + "pokemon?limit=100&offset=0");
    var list = (json.decode(response.body)["results"] as List)
        .map((data) => PokemonListView.fromJson(data))
        .toList();
    return list;
  }

  Future<PokemonData> getPokemon(String url) async {
    final response = await client.get(url);
    final pokemon =  PokemonData.fromJson(json.decode(response.body));
    return pokemon;
  }
}
