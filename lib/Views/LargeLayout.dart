import 'package:flutter/material.dart';
import 'package:poke_flutter/Components/PokedexList.dart';

class LargeLayout extends StatelessWidget {
  const LargeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PokedexList());
  }
}
