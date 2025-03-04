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
import 'components/our_focus.dart';
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
                  onTap: () {
                    Get.back();
                    if (Get.currentRoute != "/") {
                      // Navigate to home first
                      Get.offAllNamed("/")?.then((_) {
                        // Delay ensures that scrolling happens after navigation completes
                        Future.delayed(Duration(milliseconds: 300), () {
                          scrollToSection(navLinks[index]);
                        });
                      });
                    } else {
                      // Already on home, just scroll
                      scrollToSection(navLinks[index]);
                    }
                  },
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .8),
                child: Text(
                  "We revolutionize healthcare with rigorous research and bold innovation. By merging expertise across science, technology, and medicine, we create transformative solutions that tackle the world’s most urgent medical challenges, driving scalable, real-world impact ",
                  style: GoogleFonts.openSans(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: Constant.smallbheadingText(context),
                      height: 2.5),
                  textAlign: TextAlign.center,
                ),
              ),
              StartedWidget(),
              OurFocus(),
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
