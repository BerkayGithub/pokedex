import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/constants/constants.dart';
import 'poke_image_and_ball.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/pages/detail_page.dart';

class PokelistItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokelistItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(pokemon: pokemon)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? "N/A",
                style: Constants.getPokemonTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Constants.getChipTextStyle(),
                ),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
