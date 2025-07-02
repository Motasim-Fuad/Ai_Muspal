
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'resource/App_routes/routes.dart' show AppRouts;
import 'resource/getx_localization/language.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AI Muspal',

      translations: Languages(),
      // locale: Locale("zh","CN"),
      // fallbackLocale: Locale("zh","CN"),

      locale: Locale("en","US"),
      fallbackLocale: Locale("en","US"),
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: FlashScreen(),
      // akhana aga thaka jahatu / dara route inishile kora asa tai home na dilao hoba
      debugShowCheckedModeBanner: false,
      getPages: AppRouts.approutes(),
    );
  }
}




