import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonTypeName extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonTypeName({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: Constants.getPokemonTextStyle(),
                ),
              ),
              Text("#${pokemon.num}", style: Constants.getPokemonTextStyle()),
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
            label: Text(
              pokemon.type?.join(",") ?? " ",
              style: Constants.getChipTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
