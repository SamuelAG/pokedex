import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/views/pokemon_view.dart';
import '../database/api_fetch.dart';
import '../models/pokemon.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final pokeApi = new PokeApi();
  List<Pokemon> pokemons = [];
  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  void getPokemons() async {
    pokemons = await pokeApi.getList();
    setState(() {});
  }

  Widget listViewItemBuilder(BuildContext context, int index) {
    var pokemon = pokemons[index];
    return Container(

      child: GestureDetector(
        child: Card(
          color: Pokemon.type_color[pokemons[index].typeofpokemon[0].toLowerCase()],
          child: Column(
            children: [
              ListTile(
                  title: Text(
                    "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
              Image.network(pokemon.imageurl, scale: 4.5,),
            ],
          ),
        ),
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PokemonPage(
                      pokeApi: pokeApi,
                      name: pokemon.name,
                      pokemon: pokemon)));
          print(pokemon.name);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
            pokemons.length, (index) => listViewItemBuilder(context, index)),
      ),
    );
  }
}
