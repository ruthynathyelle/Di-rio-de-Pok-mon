import 'package:flutter/material.dart';
import 'package:diariodepokemon/model/pokemon_model.dart';

class DetalhesPokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const DetalhesPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name,
        style: TextStyle (

        ),),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Transform.scale(
                  scale: 1.0,
                  child: Image.network(
                    pokemon.imageUrl,
                    height: 250, 
                    fit: BoxFit.cover, 
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return child;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.error, color: Colors.red));
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                pokemon.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Nome: ${pokemon.name}',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
            ]
                   ),
                  ),

                )
              );
      
  }
}