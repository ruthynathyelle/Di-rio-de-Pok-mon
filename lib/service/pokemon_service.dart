import 'dart:convert';
import 'package:diariodepokemon/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonService {

  Future<List<Pokemon>> obterPokemon() async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<dynamic> pokemonJson = data['results'];
    
    List<Pokemon> pokemons = [];

    // Percorre cada Pokémon e busca detalhes adicionais como ID e imagem
    for (var pokemon in pokemonJson) {
      final detailsResponse = await http.get(Uri.parse(pokemon['url']));
      if (detailsResponse.statusCode == 200) {
        final detailsData = json.decode(detailsResponse.body);
        
        // Cria o objeto Pokemon com ID, nome e imagem
        pokemons.add(Pokemon.fromJson(detailsData));
      } else {
        throw Exception('Falha ao carregar detalhes do Pokémon: ${detailsResponse.reasonPhrase}');
      }
    }
    
    return pokemons;
  } else {
    throw Exception('Falha ao carregar dados: ${response.reasonPhrase}');
  }
}
Future<Pokemon> obterDetalhesPokemon(int id) async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));

  if (response.statusCode == 200) {
    final detailsData = json.decode(response.body);
    return Pokemon.fromJson(detailsData); // Supondo que seu modelo Pokemon tem os campos corretos
  } else {
    throw Exception('Falha ao carregar detalhes do Pokémon: ${response.reasonPhrase}');
  }
}

}