import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildPokemonInfoRow("Name", pokemon.name),
            buildPokemonInfoRow("Height", pokemon.height),
            buildPokemonInfoRow("Weight", pokemon.weight),
            buildPokemonInfoRow("Spawn Time", pokemon.spawnTime),
            buildPokemonInfoRow("Weakness", pokemon.weaknesses ?? "N/A"),
            buildPokemonInfoRow(
              "Pre Evolution",
              pokemon.prevEvolution ?? "N/A",
            ),
            buildPokemonInfoRow(
              "Next Evolution",
              pokemon.nextEvolution ?? "N/A",
            ),
          ],
        ),
      ),
    );
  }

  buildPokemonInfoRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constants.getPokemonInfoTextStyle()),
        if (value is List && value.isNotEmpty)
          Text(value.join(" , "), style: Constants.getPokemonInfoTextStyle2())
        else
          Text(value, style: Constants.getPokemonInfoTextStyle2()),
      ],
    );
  }
}
