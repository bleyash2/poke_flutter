import 'package:flutter/material.dart';
import 'package:poke_flutter/Models/Pokemon.dart';
import 'package:poke_flutter/Theme.dart';
import 'package:poke_flutter/utils/utils.dart';

class PokedexDetails extends StatefulWidget {
  PokedexDetails({Key key, this.currentPokemon}) : super(key: key);
  final Pokemon currentPokemon;
  @override
  _PokedexDetailsState createState() => _PokedexDetailsState();
}

class _PokedexDetailsState extends State<PokedexDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          PokemonTypeColors[this.widget.currentPokemon.details.types[0]],
      body: Stack(
        children: [
          Positioned(
              top: 150,
              left: (MediaQuery.of(context).size.width / 2) - 100,
              child: Image.asset(
                "graphics/pokeball_icon.png",
                color: Colors.white.withAlpha(50),
                height: 200,
              )),
          Container(
            margin: EdgeInsets.only(top: 300),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Text("Information Goes here"),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
          ),
          Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.arrow_back_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          this.widget.currentPokemon.name.capitalize(),
                          style:
                              TextStyles.heading2.copyWith(color: Colors.white),
                        ))
                  ])),
          Text(
            padWith0s(this.widget.currentPokemon.id),
            style: TextStyles.basic,
          )
        ],
      ),
    );
  }
}
