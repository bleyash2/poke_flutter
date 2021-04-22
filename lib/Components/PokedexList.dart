import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_flutter/Components/PokedexCard.dart';
import 'package:poke_flutter/Models/Pokemon.dart';
import 'package:http/http.dart' as http;

class PokedexList extends StatefulWidget {
  PokedexList({Key key}) : super(key: key);

  @override
  _PokedexListState createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
  Future<List<Pokemon>> pokemonList;
  List<Pokemon> actualList;
  int pageNumber;
  bool isLoading;

  Future<List<Pokemon>> getPokemon(int offset) async {
    print("Retreiving...");
    final response = await http.get(Uri.https(
        'pokeapi.co', '/api/v2/pokemon/', {"offset": offset.toString()}));
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      List<Pokemon> result = decodedJson["results"]
          .asMap()
          .entries
          .map<Pokemon>((item) =>
              Pokemon(id: item.key + 1 + offset, name: item.value["name"]))
          .toList();
      var promises = result.map((pokemon) async {
        final detailsResponse = await http
            .get(Uri.https('pokeapi.co', '/api/v2/pokemon/${pokemon.id}'));
        if (detailsResponse.statusCode == 200) {
          var decodedDetails = jsonDecode(detailsResponse.body);
          pokemon.pokemonDetails = PokemonDetails.fromJson(decodedDetails);
        }
      });
      await Future.wait(promises);
      setState(() {
        if (actualList == null) {
          actualList = result;
        } else {
          actualList.addAll(result);
        }
        isLoading = false;
      });
      return result;
    } else {
      throw Exception("Failed to Get Pokemon for List");
    }
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    pageNumber = 1;
    pokemonList = getPokemon((pageNumber - 1) * 20);
  }

  @override
  Widget build(BuildContext context) {
    if (actualList == null) {
      return Expanded(child: CircularProgressIndicator());
    } else
      return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoading &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              setState(() {
                pageNumber = pageNumber + 1;
                isLoading = true;
                pokemonList = getPokemon((pageNumber - 1) * 20);
              });
            }
          },
          child: GridView.count(
              padding: const EdgeInsets.all(20),
              childAspectRatio: (200 / 135),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: actualList
                  .map<Widget>((pokemon) => PokedexCard(pokemon: pokemon))
                  .toList()));
  }
}
