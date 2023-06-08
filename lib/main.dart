import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:final_project/binding/route_path.dart';
import 'package:final_project/binding/router.dart';
import 'package:final_project/ui/profile/profile_admin/constains.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#8A02AE');

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kDarkTheme,
      child: Builder(
        builder: (context) {
           return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      initialRoute: RoutePaths.LOGIN,
      getPages: ProjectRouter.pages,
    );
        },
      ),
    );
   
  }
}
