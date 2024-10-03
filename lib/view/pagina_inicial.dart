import 'package:flutter/material.dart';
import 'package:diariodepokemon/controller/pokemon_controller.dart';
import 'package:provider/provider.dart';
import 'package:diariodepokemon/view/detalhespokemon.dart';


class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokemonController()..carregarPokemon(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text(
            'Lista de Pokémons',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<PokemonController>(
          builder: (context, controller, child) {
            if (controller.estaCarregando) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.mensagemErro != null) {
              return Center(child: Text('Erro: ${controller.mensagemErro}'));
            }

            if (controller.pokemon == null || controller.pokemon!.isEmpty) {
              return Center(child: Text('Nenhum Pokemon encontrado.'));
            }

            return ListView.builder(
            
              itemCount: controller.pokemon!.length,
              itemBuilder: (context, index) {
                final pokemon = controller.pokemon![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(pokemon.name),
                    subtitle: Text('Autor: ${pokemon.name}'),
                    leading: Image.network(
                      pokemon.imageUrl
                    ),
                    tileColor: Colors.grey[100],                  
                    isThreeLine: true,
                    onTap: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesPokemonPage(pokemon: pokemon),
                        ),
                      );
                    },
                   
                  ),
                );
              
              },
            );
          },
        ),
      ),
    );
  }
}