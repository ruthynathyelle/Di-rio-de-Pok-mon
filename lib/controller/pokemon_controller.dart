import 'package:get/get.dart';
import 'package:diariodepokemon/model/pokemon_model.dart';
import 'package:diariodepokemon/service/pokemon_service.dart';

class PokemonController extends GetxController {
  final PokemonService _pokemonService = PokemonService();
  
  var pokemons = <Pokemon>[].obs; // Lista reativa de Pokémons
  var mensagemErro = ''.obs; // Mensagem de erro reativa
  var estaCarregando = false.obs; // Estado de carregamento reativo

  @override
  void onInit() {
    super.onInit();
    carregarPokemon(); // Carregar pokémons ao inicializar o controller
  }

  Future<void> carregarPokemon() async {
    estaCarregando.value = true;

    try {
      var resultado = await _pokemonService.obterPokemon();
      pokemons.assignAll(resultado); // Atualiza a lista de Pokémons
      mensagemErro.value = ''; // Limpa a mensagem de erro
    } catch (e) {
      mensagemErro.value = 'Erro ao carregar pokémons: $e';
      pokemons.clear(); // Limpa a lista em caso de erro
    } finally {
      estaCarregando.value = false;
    }
  }
}
