import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:diariodepokemon/model/pokemon_model.dart';
import 'package:diariodepokemon/service/pokemon_service.dart';

class PokemonController extends ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon>? _pokemons;
  String? _mensagemErro;
  bool _estaCarregando = false;

  List<Pokemon>? get pokemon => _pokemons;
  String? get mensagemErro => _mensagemErro;
  bool get estaCarregando => _estaCarregando;

  Future<void> carregarPokemon() async {
    _estaCarregando = true;
    notifyListeners();

    try {
      _pokemons = await _pokemonService.obterPokemon();
      _mensagemErro = null;
    } catch (e) {
      _mensagemErro = 'Erro: $e';
      _pokemons = null;
    } finally {
      _estaCarregando = false;
      notifyListeners();
    }
  }
}