import 'package:archlelabswebsite/view/blog_details.dart';
import 'package:archlelabswebsite/view/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_routes.dart';
import 'view/components/speech.dart';
import 'package:get/get.dart';
Future<void> main() async { WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 400));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     precacheImage(const AssetImage("assets/images/robo.png"), context);
    precacheImage(const AssetImage('assets/images/about us.gif'), context);
    return GetMaterialApp(
      title: 'Archle Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // fontFamily: GoogleFonts.bebasNeue().fontFamily,
        fontFamily: 'Bebasnue',
        useMaterial3: false,
      ),
       getPages:appRoutes(),
       initialRoute: Routes.home,
       unknownRoute: GetPage(name: "/page_not_found", page:()=> Scaffold(body: Center(child: Text("Page not found"),),)),
       
    );
  }
}
