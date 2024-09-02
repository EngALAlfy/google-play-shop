import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_play_shop/ui/cubits/product_cubit.dart';
import 'package:google_play_shop/ui/screens/home_screen.dart';
import 'package:google_play_shop/utils/colors_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nb_utils/nb_utils.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    initialize(),
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      child: Phoenix(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(),
        ),],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
            fontFamily: "Harmattan",
            primaryColor: ColorsManager.primary,
            primaryColorLight: ColorsManager.primaryLight,
            primaryColorDark: ColorsManager.primaryDark,
            colorScheme: const ColorScheme.dark(
                primary: ColorsManager.primary,
                secondary: ColorsManager.secondary),
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.transparent,
            )),
        builder: (context, child) => Overlay(
          initialEntries: [
            if (child != null) ...[
              OverlayEntry(
                builder: (context) => LoaderOverlay(child: child),
              ),
            ],
          ],
        ),
        home: const HomeScreen(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
