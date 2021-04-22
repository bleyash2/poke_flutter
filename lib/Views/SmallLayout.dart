import 'package:flutter/material.dart';
import 'package:poke_flutter/Components/PokedexList.dart';
import 'package:poke_flutter/Theme.dart';

class SmallLayout extends StatelessWidget {
  const SmallLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PokedexListView();
  }
}

class PokedexListView extends StatelessWidget {
  const PokedexListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Positioned(
            top: -100,
            right: -100,
            child: Stack(children: [
              Image.asset(
                "graphics/pokeball_icon.png",
                color: Colors.black.withAlpha(50),
                height: 300,
              )
            ])),
        Positioned(
            top: 25,
            left: 25,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text("Pokedex", style: TextStyles.heading2))
                ])),
        Container(margin: EdgeInsets.only(top: 125), child: PokedexList())
      ]),
    );
  }
}
