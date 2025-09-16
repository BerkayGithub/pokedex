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
    if (ScreenUtil().orientation == Orientation.portrait) {
      return buildPortraitScreen(context);
    } else {
      return buildLandscapeScreen(context);
    }
  }

  Scaffold buildPortraitScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 24.w,
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
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInformation(pokemon: pokemon),
                  ),
                  Hero(
                    tag: pokemon.id!,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? '',
                        height: 0.25.sh,
                        fit: BoxFit.fitHeight,
                      ),
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

  Scaffold buildLandscapeScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PokemonTypeName(pokemon: pokemon),
                        SizedBox(height: 20),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.15.sw,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 3 ,child: PokeInformation(pokemon: pokemon)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
