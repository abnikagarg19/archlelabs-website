import 'package:archlelabswebsite/utils/constants.dart';
import 'package:archlelabswebsite/view/blog_details.dart';
import 'package:archlelabswebsite/view/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'view/components/speech.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 400));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
        primaryColor: Colors.black
      ),
      getPages: appRoutes(),
      initialRoute: Routes.home,
      unknownRoute: GetPage(
          name: "/page_not_found",
          page: () => Scaffold(
                body: Center(
                  child: Text("Page not found"),
                ),
              )),
      home: HomeWidgets()
    );
  }

  // Sample data
  final List<Map<String, String>> data = [
    {
      "title": "Application Development",
      "description":
          "Assist in building and maintaining cross-platform apps using Flutter."
    },
    {
      "title": "Feature Implementation",
      "description":
          "Collaborate with senior developers to design and implement features."
    },
    {
      "title": "Testing & Debugging",
      "description": "Ensure a high-quality user experience through debugging."
    },
    {
      "title": "Code Quality",
      "description": "Write clean, efficient, and maintainable code."
    },
    {
      "title": "Version Control",
      "description":
          "Follow coding standards and best practices, including Git."
    },
    {
      "title": "Unit Testing",
      "description": "Support QA in identifying bugs and writing test cases."
    },
  ];
}