import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonPage extends StatelessWidget {
  final pokeApi;
  final name;
  final pokemonData;
  const PokemonPage({@required this.pokeApi, @required this.name, this.pokemonData});

  @override
  Widget build(BuildContext context) {
    print(pokemonData.sprites.frontDefault);
    return Scaffold(
      appBar: AppBar(
        title: Text("${name[0].toUpperCase()}${name.substring(1)}"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black, spreadRadius: 3),
            ],),
          child: Row(
            children: [
              Image.network(pokemonData.sprites.frontDefault, scale: 0.6,),
              Image.network(pokemonData.sprites.backDefault, scale: 0.6,),
            ],
          ),
        ) ,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
