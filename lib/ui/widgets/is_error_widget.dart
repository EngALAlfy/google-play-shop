import 'package:google_play_shop/generated/assets.dart';
import 'package:google_play_shop/generated/codegen_loader.g.dart';
import 'package:google_play_shop/utils/style_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class IsErrorWidget extends StatelessWidget {
  final String? error;
  final Function? retry;

  const IsErrorWidget({super.key, this.error, this.retry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesError,
              color: Colors.red, height: 200, width: 200),
          Text((error ?? LocaleKeys.unknown_error).tr(),style: StyleManager.textStyleDark16),
        ],
      ).onTap(retry),
    );
  }
}
