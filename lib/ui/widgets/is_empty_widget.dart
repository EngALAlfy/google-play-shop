
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_play_shop/generated/assets.dart';
import 'package:google_play_shop/generated/codegen_loader.g.dart';
import 'package:google_play_shop/utils/style_manager.dart';

class IsEmptyWidget extends StatelessWidget {

  const IsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesEmpty,
               height: 200, width: 200),
          Text(LocaleKeys.no_data.tr(),style: StyleManager.textStyleDark16),
        ],
      ),
    );
  }
}
