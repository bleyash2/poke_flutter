import 'package:flutter/material.dart';
import 'package:poke_flutter/Components/PokedexDetails.dart';
import 'package:poke_flutter/Models/Pokemon.dart';
import 'package:poke_flutter/Theme.dart';
import 'package:poke_flutter/utils/utils.dart';

class TypeBadge extends StatelessWidget {
  const TypeBadge({Key key, this.typeText}) : super(key: key);

  final String typeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        typeText.capitalize(),
        style: TextStyles.basic.copyWith(color: Colors.white, fontSize: 10),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: pokemonBadgeColors[typeText]),
    );
  }
}

class PokedexCard extends StatelessWidget {
  const PokedexCard({Key key, this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  Container buildTypes() {
    return Container(
      child: Column(
        children: pokemon.details.types
            .map<Widget>((type) => TypeBadge(typeText: type))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, _, __) => PokedexDetails(
                        currentPokemon: pokemon,
                      )));
        },
        child: Container(
          child: Stack(
            children: [
              Positioned(
                  right: -10,
                  bottom: -20,
                  child: Image.asset(
                    "graphics/pokeball_icon.png",
                    color: Colors.white.withAlpha(50),
                    height: 100,
                  )),
              Positioned(
                  right: 10,
                  top: 10,
                  child: Text(
                    padWith0s(pokemon.id),
                    style: TextStyles.bold
                        .copyWith(color: Colors.black.withAlpha(50)),
                  )),
              Positioned(
                  left: 15,
                  top: 20,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name.capitalize(),
                          style: TextStyles.bold.copyWith(color: Colors.white),
                        ),
                        buildTypes()
                      ])),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.network(
                    'https://cors-anywhere.herokuapp.com/' +
                        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${padWith0s(pokemon.id)}.png',
                    width: 100,
                    height: 75,
                  )),
            ],
          ),
          decoration: BoxDecoration(
            color: PokemonTypeColors[pokemon.details.types[0]],
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ));
  }
}
