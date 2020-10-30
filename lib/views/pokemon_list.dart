import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/views/pokemon_view.dart';
import '../database/api_fetch.dart';
import '../models/pokemon.dart';
import 'package:hexcolor/hexcolor.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final pokeApi = new PokeApi();
  Map<String, Color> type_color = {
    "normal": HexColor("#A8A878"),
    "fighting": HexColor("#C03028"),
    "flying": HexColor("#A890F0"),
    "poison": HexColor("#A040A0"),
    "ground": HexColor("#E0C068"),
    "rock": HexColor("#B8A038"),
    "bug": HexColor("#A8B820"),
    "ghost": HexColor("#705898"),
    "steel": HexColor("#B8B8D0"),
    "fire": HexColor("#F08030"),
    "water": HexColor("#6890F0"),
    "grass": HexColor("#78C850"),
    "electric": HexColor("#F8D030"),
    "psychic": HexColor("#F85888"),
    "dragon": HexColor("#7038F8"),
    "dark": HexColor("#2C2E2B"),
    "fairy": HexColor("#E03A83"),
    "unknown": HexColor("#FFFFFF"),
    "shadow": HexColor("#705898"),
  };
  List<PokemonListView> pokemons = [];
  List<PokemonData> pokemonsData = [];
  @override
  void initState() {
    super.initState();
    getPokemons();

  }

  void getPokemons() async {
    pokemons = await pokeApi.getList();
    await getEachPokemons();
    setState(() {});
  }

  void getEachPokemons() async {
    for(int i = 0; i < pokemons.length; i++) {
      final data = await pokeApi.getPokemon(pokemons[i].url);
      pokemonsData.add(data);
      print(pokemonsData[i].types[0].type.name);
    }
  }

  Widget listViewItemBuilder(BuildContext context, int index) {
    var pokemon = pokemons[index];
    return Container(
      margin: EdgeInsets.all(3),
      child: GestureDetector(
        child: Card(
          color: type_color[pokemonsData[index].types[0].type.name],
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index+1}.png", scale: 1,),
            ],
          ),
        ),
        onTap: () async {
          PokemonData pokemonData = await pokeApi.getPokemon(pokemon.url);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonPage(
                      pokeApi: pokeApi,
                      name: pokemon.name,
                      pokemonData: pokemonData)));
          print(pokemon.name);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            pokemons.length, (index) => listViewItemBuilder(context, index)),
      ),
    );
  }
}
