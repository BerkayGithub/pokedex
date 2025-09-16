import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/widgets/pokemon_type_name.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailPage({super.key, required this.pokemon});

  final String pokeballImageUrl = 'assets/images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            PokemonTypeName(pokemon: pokemon),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      pokeballImageUrl,
                      height: 0.15.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    child: PokeInformation(pokemon: pokemon),
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
