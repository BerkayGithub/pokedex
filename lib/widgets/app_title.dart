import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  final String _pokeballImageUrl = 'assets/images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Constants.title,
                style: Constants.getTitleTextStyle(),
              ),
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              _pokeballImageUrl,
              width: UIHelper.getAppTitleImageWidth(),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
