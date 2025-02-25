import 'package:archlelabswebsite/controller/homeController.dart';
import 'package:archlelabswebsite/responsive/layouts.dart';
import 'package:archlelabswebsite/theme/app_theme.dart';
import 'package:archlelabswebsite/utils/constants.dart';
import 'package:archlelabswebsite/view/components/navbar.dart';
import 'package:archlelabswebsite/view/components/team.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/globals.dart';
import '../utils/parallax.dart';
import 'components/aboutus.dart';
import 'components/articles.dart';
import 'components/contactus.dart';
import 'components/footer.dart';
import 'components/started_widget.dart';

class HomeWidgets extends StatelessWidget {
  HomeWidgets({super.key});
  String robotimage = "assets/images/robo.png";
  final _controller = Get.put<HomeController>(HomeController());
  void _scrollToContainer(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500), // Smooth animation
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: AppTheme.black,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    navLinks[index],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: navLinks.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: Globals.scrollController,
        child: Center(
          child: Column(
            children: <Widget>[
              Header(),
              SizedBox(
                height: 120,
              ),
              ParallaxWidget(
                movementFactor: 0.5, // Adjust movement factor as desired
                child: Text(
                  "Unlocking the future\nof Innovations",
                  style: GoogleFonts.bebasNeue(
                      color: AppTheme.whiteColor,
                      height: 1.5,
                      fontSize: Constant.mainHeading(context),
                      letterSpacing: 5),
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                robotimage,
                key: ValueKey(robotimage),
                fit: BoxFit.cover,
              ),
              StartedWidget(),
              AboutusWidget(),
              TeamWidget(),
              ArticlesWidget(),
              ContactUs(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
