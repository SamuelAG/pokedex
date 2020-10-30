import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonPage extends StatefulWidget {
  final pokeApi;
  final name;
  final pokemon;
  const PokemonPage(
      {@required this.pokeApi, @required this.name, this.pokemon});

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:
            Pokemon.type_color[widget.pokemon.typeofpokemon[0].toLowerCase()],
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 50, left: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Text(
                      " ${widget.pokemon.typeofpokemon[0]} ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              widget.pokemon.imageurl,
              scale: 2.5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: Container(
                height: 60,
                margin: EdgeInsets.only(left: 5),
                child: TabBar(
                  tabs: [
                    Text(
                      'About',
                      style: TextStyle(fontSize: 14),
                      softWrap: false,
                    ),
                    Text(
                      'Base Stats',
                      style: TextStyle(fontSize: 14),
                      softWrap: false,
                    ),
                    Text(
                      'Evolution',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Move',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                  unselectedLabelColor: Colors.grey[700],
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.redAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  indicatorPadding: EdgeInsets.all(0),
                  isScrollable: false,
                  controller: _tabController,
                ),
              ),
            ),
            Container(
              color: Colors.grey[100],
              height: 320.4,
              child: TabBarView(controller: _tabController, children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 15),
                  child: Column(
                    children: [
                      Text(
                        widget.pokemon.xdescription,
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        height: 90,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 17, left: 60, bottom: 4),
                                      child: Text("Height",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[600]))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 60, bottom: 4),
                                      child: Text(widget.pokemon.height))
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 17, left: 120, bottom: 4),
                                      child: Text("Weight",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey[600]))),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 120, bottom: 4),
                                      child: Text(widget.pokemon.weight))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Text("sign up"),
                ),
                Center(
                  child: Text("login"),
                ),
                Center(
                  child: Text("sign up"),
                )
              ]),
            )
          ],
        ),
        alignment: Alignment.topCenter,
      ),
    );
  }
}
