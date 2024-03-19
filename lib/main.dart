import 'package:benny_barber/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es', '')],
      useInheritedMediaQuery: true,
      title: 'Application',
      initialRoute: _setInitialRoute(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // backgroundColor: Palette.darkGreen,
          // iconTheme: IconThemeData(color: Palette.white),
          // titleTextStyle: TextStyle(
          //   color: Palette.white,
          //   fontSize: 18,
          // ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}

String _setInitialRoute() {
  // final firebaseUser = auth.getCurrentUser();
  // if (firebaseUser != null) {
  // return Routes.LOGIN;
  return Routes.HOME;
  // } else {
  //   return Routes.LOGIN;
  // }
}
