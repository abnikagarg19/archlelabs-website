import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../responsive/layouts.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/globals.dart';

void scrollToSection(String section) {
  GlobalKey targetKey;

  if (section == "About Us") {
    targetKey = Globals.container1Key;
  }
   else if (section == "Home") {
    targetKey = Globals.homekey;
  } 
   else if (section == "Articles") {
    targetKey = Globals.container2Key;
  } 
 
   else if (section == "Our Focus") {
    targetKey = Globals.container4Key;
  } 
   else if (section == "Our Team") {
    targetKey = Globals.teamSection;
  } 
   else if (section == "Contact us") {
    targetKey = Globals.container3Key;
  } 
  else {
    targetKey = Globals.container3Key;
  }

scrollToContainer(targetKey);
}

final navLinks = ["Home", "Our Focus","About Us", "Our Team","Articles",  "Contact us"];
List<Widget> navItem() {
  return navLinks.map((text) {
    return Padding(
      padding: EdgeInsets.only(left: 60),
      child: InkWell(
        onTap: () {
          if (Get.currentRoute != "/") {
            // Navigate to home first
            Get.offAllNamed("/")?.then((_) {
              // Delay ensures that scrolling happens after navigation completes
              Future.delayed(Duration(milliseconds: 300), () {
                scrollToSection(text);
              });
            });
          } else {
            // Already on home, just scroll
            scrollToSection(text);
          }
        
        },
        child: Text(text,
            style: GoogleFonts.openSans(
                color: AppTheme.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
      ),
    );
  }).toList();
}

void scrollToContainer(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: 500), // Smooth animation
      curve: Curves.linear,
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[...navItem()]);
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: buildHeader(),
      // We will make this in a bit
      smallScreen: buildMobileHeader(),
      mediumScreen: buildHeader(),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 60,
            ),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState!.openEndDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 80,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[...navItem()])
          ],
        ),
      ),
    );
  }
}
