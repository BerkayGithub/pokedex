import 'package:pokedex/model/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class PokeApi{
  static const String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> list = [];

    var result = await Dio().get(url);
    var pokeList = jsonDecode(result.data)['pokemon'];
    if(pokeList is List){
      list = pokeList.map((e) => PokemonModel.fromMap(e)).toList();
    }else {
      return [];
    }

    return list;
  }
}