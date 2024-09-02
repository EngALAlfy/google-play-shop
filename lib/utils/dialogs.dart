import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_play_shop/data/config/config.dart';
import 'package:google_play_shop/generated/assets.dart';
import 'package:google_play_shop/generated/codegen_loader.g.dart';
import 'package:nb_utils/nb_utils.dart' as nb;


confirmTermsAnPrivacy(context) async {
  bool confirmed =
      nb.getBoolAsync('terms_and_privacy_confirmed', defaultValue: false);
  if (!confirmed) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      title: LocaleKeys.confirm.tr(),
      useRootNavigator: true,
      body: SizedBox(
        height: 300.dynamicHeight,
        // child: buildWebViewWidget(Config.termsUrl),
      ),
      btnOkOnPress: () async {
        nb.setValue('terms_and_privacy_confirmed', true);
      },
      btnOkText: LocaleKeys.yes.tr(),
      btnCancelText: LocaleKeys.no.tr(),
      btnCancelOnPress: () {
        SystemNavigator.pop(animated: true);
      },
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
    ).show();
  }
}

aboutDialog(context) async {
  var info = await nb.getPackageInfo();
  showAboutDialog(
    context: context,
    applicationIcon: Image.asset(Assets.imagesLogo ,height: 50,width: 50,),
    applicationName: "${LocaleKeys.app_name.tr()}",
    applicationVersion: "${info.versionName} (${info.versionCode})",
    children: [
      SizedBox(
        height: 400,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          // child: buildWebViewWidget(Config.aboutUrl),
        ),
      ),
    ],
  );
}

privacyDialog(context) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.noHeader,
    title: LocaleKeys.privacy.tr(),
    useRootNavigator: true,
    body: SizedBox(
      height: 300.dynamicHeight,
      // child: buildWebViewWidget(Config.privacyUrl),
    ),
    btnOkText: LocaleKeys.yes.tr(),
    btnOkOnPress: (){}
  ).show();
}