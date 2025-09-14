import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokedex_api.dart';
import 'package:pokedex/widgets/pokelist_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
            ),
            itemBuilder: (context, index) => PokelistItem(pokemon: list[index]),
            itemCount: list.length,
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
