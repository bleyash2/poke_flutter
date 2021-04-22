class Pokemon {
  int id;
  String name;
  PokemonDetails details;
  Pokemon({this.id, this.name});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], id: json['id']);
  }

  set pokemonDetails(PokemonDetails details) {
    this.details = details;
  }
}

class PokemonDetails {
  int id;
  String name;
  List<String> types;
  int height;
  int weight;

  PokemonDetails({this.id, this.name, this.types, this.height, this.weight});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(
        name: json['name'],
        id: json['id'],
        height: json['height'],
        weight: json['weight'],
        types: json['types']
            .map<String>((type) => type["type"]['name'] as String)
            .toList());
  }
}
