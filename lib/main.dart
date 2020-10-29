import 'package:flutter/material.dart';
import 'database/api_fetch.dart';
import 'models/pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pokedex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final poke = new PokeApi();
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  void getPokemons() async {
    pokemons = await poke.getPokemons();
    setState(() {});
  }

  Widget listViewItemBuilder(BuildContext context, int index) {
    var pokemon = pokemons[index];
//    print("Abilities: " + pokemon.abilities.toString());
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: Text(pokemon.name),
      trailing:Text(pokemon.abilities[0].ability.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: listViewItemBuilder
      ),
    );
  }
}
