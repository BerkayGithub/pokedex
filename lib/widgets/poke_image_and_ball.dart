import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/constants/ui_helper.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final String pokeballImageUrl = 'assets/images/pokeball.png';

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            height: UIHelper.calculatePokeImageBallAndSize(),
            width: UIHelper.calculatePokeImageBallAndSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            imageUrl: pokemon.img ?? "",
            errorWidget: (context, url, error) => Icon(Icons.error_outline),
            height: UIHelper.calculatePokeImageBallAndSize(),
            width: UIHelper.calculatePokeImageBallAndSize(),
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
