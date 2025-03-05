import 'package:archlelabswebsite/controller/homeController.dart';
import 'package:archlelabswebsite/responsive/layouts.dart';
import 'package:archlelabswebsite/theme/app_theme.dart';
import 'package:archlelabswebsite/utils/constants.dart';
import 'package:archlelabswebsite/view/components/navbar.dart';
import 'package:archlelabswebsite/view/components/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

class HomeWidgets extends StatefulWidget {
  HomeWidgets({super.key});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  String robotimage = "assets/images/robo.png";

  final _controller = Get.put<HomeController>(HomeController());
  bool isloaded = false;
  void _scrollToContainer(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500), // Smooth animation
        curve: Curves.easeInOut,
      );
    }
  } // mobile header

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

  final _image = AssetImage('assets/images/robo.png');
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isloaded = true;
      });
    });
    // Add your own initState code here
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          automaticallyImplyLeading: false,

        actions: <Widget>[Container()],
            toolbarHeight: 90.0,
            backgroundColor: Colors.transparent,
            title: ResponsiveLayout(
              largeScreen: buildHeader(),
              // We will make this in a bit
              smallScreen: buildMobileHeader(),
              mediumScreen: buildHeader(),
            )),
      ),
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
      body: !isloaded
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : SingleChildScrollView(
              controller: Globals.scrollController,
              child: Center(
                child: Column(
                  children: <Widget>[
                 //   Header(),
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Unlocking the future\nof Innovations",
                      style: TextStyle(
                          color: AppTheme.whiteColor,
                          height: 1.5,
                          fontSize: Constant.mainHeading(context),
                          letterSpacing: 5),
                      textAlign: TextAlign.center,
                    ),
                    Image(
                      image: _image,
                      gaplessPlayback: true,
                      // key: ValueKey(robotimage),
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
                            fontSize: Constant.TextSize20(context),
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
