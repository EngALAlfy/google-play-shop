import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_play_shop/generated/codegen_loader.g.dart';
import 'package:nb_utils/nb_utils.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 8,left: 8,right: 8),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1,
          children: [
            billCard(
              icon: LineIcons.shopping_cart,
              title: LocaleKeys.buy.tr(),
              subtitle: LocaleKeys.buy_desc.tr(),
              subtitleColor: Colors.red,
            ).onTap(() {

            }),
            billCard(
              icon: IconlyBold.user3,
              title: LocaleKeys.my_account.tr(),
              subtitle: LocaleKeys.my_account_desc.tr(),
              subtitleColor: Colors.green,
            ),
            billCard(
              icon: Icons.privacy_tip_outlined,
              title: LocaleKeys.privacy.tr(),
              subtitle: LocaleKeys.privacy_desc.tr(),
              subtitleColor: Colors.blue,
            ),
            billCard(
              icon: IconlyBroken.infoCircle,
              title: LocaleKeys.terms.tr(),
              subtitle: LocaleKeys.terms_desc.tr(),
              subtitleColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget billCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color subtitleColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 10.dynamicHeight),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.dynamicHeight),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: subtitleColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
