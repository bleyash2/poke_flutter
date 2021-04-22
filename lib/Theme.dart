import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  const TextStyles();

  static TextStyle basic = GoogleFonts.poppins();
  static TextStyle bold = basic.copyWith(fontWeight: FontWeight.bold);
  static TextStyle heading =
      basic.copyWith(fontWeight: FontWeight.bold, fontSize: 48);
  static TextStyle heading2 = heading.copyWith(fontSize: 30);
}

const Map<String, Color> PokemonTypeColors = {
  "grass": Color(0xff75d1a9),
  "fire": Color(0xffe86d38),
  "water": Color(0xff38a2e8),
  "bug": Color(0xffb3e838),
  "normal": Color(0xffebd28d),
  "poison": Color(0xffc959eb),
  "flying": Color(0xff8dd7eb),
  "electric": Color(0xfff0d14a),
  "ground": Color(0xffbd8642),
  "rock": Color(0xff5c4b35),
  "steel": Color(0xffa6a6a6),
  "psychic": Color(0xffed74b7),
  "fairy": Color(0xfff7abd5),
  "ice": Color(0xffabf1f7),
  "dragon": Color(0xff8e6af7),
  "ghost": Color(0xff302c61),
  "dark": Color(0xff423c3c),
  "fighting": Color(0xff5c2003)
};

Map<String, Color> pokemonBadgeColors = PokemonTypeColors.map((key, value) =>
    MapEntry(key, HSLColor.fromColor(value).withLightness(0.7).toColor()));
