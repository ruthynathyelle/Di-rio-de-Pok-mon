import 'dart:convert';
import 'package:diariodepokemon/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonService {

  Future<List<Pokemon>> obterPokemon() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> pokemonJson = data['results'];
      return pokemonJson.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados: ${response.reasonPhrase}');
    }
  }
}