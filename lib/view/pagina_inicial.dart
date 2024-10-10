import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detalhespokemon.dart';
import 'package:diariodepokemon/controller/pokemon_controller.dart';

class PaginaInicial extends StatelessWidget {
  final PokemonController controller = Get.put(PokemonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokémons')),
      body: Obx(() {
        if (controller.estaCarregando.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.mensagemErro.value.isNotEmpty) {
          return Center(child: Text(controller.mensagemErro.value));
        }

        return ListView.builder(
          itemCount: controller.pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = controller.pokemons[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(pokemon.name),
                subtitle: Text('Autor: ${pokemon.name}'), // Verifique se 'Autor' é apropriado
                leading: Image.network(
                  pokemon.imageUrl,
                  width: 50, // Defina uma largura para a imagem
                  height: 50, // Defina uma altura para a imagem
                  fit: BoxFit.cover, // Ajusta a imagem
                ),
                tileColor: Colors.grey[100],
                isThreeLine: true,
                onTap: () {
                  // Navegar para a página de detalhes do Pokémon
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesPokemon(pokemon: pokemon),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
