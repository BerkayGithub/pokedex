import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>>
  _pokemonListFuture; //Listeyi burada oluşturup init içinde atama yaparsan o zaman build fonksiyonu her tekrar ettiğinde tekrar atama yapmaz

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> list = snapshot.data!;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var oankiPokemon = list[index];
              return ListTile(title: Text(oankiPokemon.name.toString()));
            },
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("Hata çıktı"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
