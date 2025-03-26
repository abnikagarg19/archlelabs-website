import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../controller/homeController.dart';
import '../../responsive/layouts.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/globals.dart';

class AboutusWidget extends StatelessWidget {
  AboutusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _aboutus(context, 1230.0),
      // We will make this in a bit
      smallScreen: _aboutus(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _aboutus(context, 770.0),
    );
  }

  List valuesList = [
    {
      "title": "Relentless Innovation",
      "details":
          "We push boundaries to create breakthrough healthcare solutions."
    },
    {
      "title": "User-Centric Design",
      "details":
          "Our solutions prioritize healthcare professionals, patients, and caregivers."
    },
    {
      "title": "Solution-Driven Approach",
      "details":
          "Multidisciplinary teamwork fuels creativity and problem-solving."
    },
    {
      "title": "Sustainability and Responsibility",
      "details":
          "We innovate ethically, minimizing environmental impact and improving public health."
    },
    {
      "title": "Collaboration and Diversity",
      "details": "We anticipate trends, shaping a healthier future."
    },
    {
      "title": "Human-Centered Commitment",
      "details": "Empathy and care drive the mission to enhance well-being."
    },
    {
      "title": "Precision and Reliability",
      "details": "We ensure accuracy and consistency in every solution."
    },
    {
      "title": "Timeless Quality",
      "details": "Our high standards ensure long-lasting value in healthcare."
    },
    {
      "title": "Continuous Development ",
      "details": " We embrace learning, research, and adaptability."
    },
    {
      "title": "Pioneering Tomorrow",
      "details": "We anticipate trends, shaping a healthier future."
    },
  ];
  Widget _aboutus(context, width) {
    return LayoutBuilder(builder: (context, constraints) {
      return GetBuilder<HomeController>(builder: (_controller) {
        return Container(
          //  key: Globals.container1Key,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              // Background GIF
              Positioned(
                top: 0,
                bottom: constraints.maxWidth > 800 ? 500 : 800,
                right: 0,
                left: 0,
                child: Image.asset(
                  constraints.maxWidth > 800
                      ? "assets/images/aboutus3.gif"
                      : "assets/images/ss.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),
              ),

              // Additional Overlay Image
              Positioned.fill(
                child: Image.asset(
                  "assets/images/gradient.png",
                  //  alignment: Alignment.bottomLeft,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Container(
                      color: const Color.fromRGBO(255, 255, 255, 0.54))),
              // Content Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VisibilityDetector(
                    key: Globals.container1Key,
                    onVisibilityChanged: (VisibilityInfo info) {
                      print(info.visibleFraction);
                      if (info.visibleFraction > 0.05) {
                        print("visible");
                        _controller.changeAboutus(); // o
                      } //else {
                      // _controller.changenotAboutus(); // o
                      // }
                    },
                    child: constraints.maxWidth > 800
                        ? Center(
                          child: Container( constraints: BoxConstraints(maxWidth: width),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 350,
                                        height: 500,
                                        child: Image.asset(
                                          "assets/images/space2.png",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      Positioned(
                                        top: 100,
                                        right: -370,
                                        child: Text("About Us",
                                            style: GoogleFonts.openSans(
                                              color: AppTheme.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: Constant.bigFont94(context),
                                              letterSpacing: 3,
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 240),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Text(
                                            "Archle Labs is an advanced research center for health and life sciences engineering, committed to revolutionizing the healthcare field. We combine cutting-edge technology, interdisciplinary expertise fueled by  unwavering passion for innovation to tackle the world’s most pressing medical challenges. By developing novel solutions and services, we aim to elevate human health, enhance patient outcomes, and transform global healthcare practices.",
                                            style: GoogleFonts.openSans(
                                              color: AppTheme.black,
                                              fontSize:
                                                  Constant.TextSize20(context),
                                              height: 1.5,
                                            ),
                                            textAlign: TextAlign.justify,
                                          )
                                              .animate(
                                                target: _controller.isAboutuseVisble
                                                    ? 1
                                                    : 0,
                                              )
                                              .fadeIn(
                                                delay: 200.ms,
                                                duration: 600.ms,
                                                curve: Curves.linear,
                                              ),
                                        ),
                                        // .moveX(
                                        //     begin: 300,
                                        //     end: 0,
                                        //     duration: 800.ms,
                                        //     curve: Curves.linear),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  
                                  
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 250,
                                            child: Image.asset(
                                              "assets/images/space2.png",
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          Positioned(
                                            top: 80,
                                            left: 90,
                                            child: Text("About Us",
                                                style: GoogleFonts.openSans(
                                                  color: AppTheme.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: Constant.bigFont94(
                                                      context),
                                                  letterSpacing: 3,
                                                )),
                                          )
                                        ],
                                      ),
                                    // Text(
                                    //   "About Us",
                                    //   style: GoogleFonts.openSans(
                                    //     color: AppTheme.black,
                                    //     fontWeight: FontWeight.w600,
                                    //     fontSize: Constant.bigFont94(context),
                                    //     letterSpacing: 3,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        "Archle Labs is an advanced research center for health and life sciences engineering, committed to revolutionizing the healthcare field. We combine cutting-edge technology, interdisciplinary expertise fueled by  unwavering passion for innovation to tackle the world’s most pressing medical challenges. By developing novel solutions and services, we aim to elevate human health, enhance patient outcomes, and transform global healthcare practices.",
                                        style: GoogleFonts.openSans(
                                          color: AppTheme.black,
                                          fontSize:
                                              Constant.TextSize20(context),
                                          height: 1.5,
                                        ),
                                        textAlign: TextAlign.justify,
                                      )
                                          .animate(
                                            target: _controller.isAboutuseVisble
                                                ? 1
                                                : 0,
                                          )
                                          .fadeIn(
                                            delay: 200.ms,
                                            duration: 600.ms,
                                            curve: Curves.linear,
                                          ),
                                    ),
                                    // .moveX(
                                    //     begin: 300,
                                    //     end: 0,
                                    //     duration: 800.ms,
                                    //     curve: Curves.linear),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  VisibilityDetector(
                    key: Key("mission"),
                    onVisibilityChanged: (VisibilityInfo info) {
                      print(info);
                      if (info.visibleFraction > 0.05) {
                        print("visible");
                        _controller.changeisMissionSection(true); // o
                      }
                      // } else {
                      //   _controller.changeisMissionSection(false); // o
                      // }
                    },
                    child: Container(
                      constraints: BoxConstraints(maxWidth: width),
                      child: Flex(
                          direction: constraints.maxWidth > 800
                              ? Axis.horizontal
                              : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: constraints.maxWidth > 800 ? 6 : 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Our Vision",
                                      style: GoogleFonts.bebasNeue(
                                        color: AppTheme.black,
                                        fontSize:
                                            Constant.subheadingText(context),
                                        letterSpacing: 5,
                                      ),
                                    )
                                        .animate(
                                          target: _controller.isMissionSection
                                              ? 1
                                              : 0,
                                        )
                                        .fadeIn(
                                          delay: 200.ms,
                                          duration: 600.ms,
                                          curve: Curves.linear,
                                        ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "To revolutionize medical science, forging a future where no challenge is insurmountable and every life thrives.",
                                      style: GoogleFonts.openSans(
                                        color: AppTheme.black,
                                        fontSize: Constant.TextSize20(context),
                                        height: 1.5,
                                      ),
                                    )
                                        .animate(
                                          target: _controller.isMissionSection
                                              ? 1
                                              : 0,
                                        )
                                        .fadeIn(
                                          delay: 600.ms,
                                          duration: 600.ms,
                                          curve: Curves.linear,
                                        ),
                                    const SizedBox(height: 30),
                                    Text(
                                      "Our Mission",
                                      style: GoogleFonts.bebasNeue(
                                        color: AppTheme.black,
                                        fontSize:
                                            Constant.subheadingText(context),
                                        letterSpacing: 5,
                                      ),
                                    )
                                        .animate(
                                          target: _controller.isMissionSection
                                              ? 1
                                              : 0,
                                        )
                                        .fadeIn(
                                          delay: 1000.ms,
                                          duration: 600.ms,
                                          curve: Curves.linear,
                                        ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Our mission is to harness rigorous, interdisciplinary research and advanced engineering methodologies to drive transformative solutions for complex healthcare challenges—ultimately fostering equitable access and vibrant global health.",
                                      style: GoogleFonts.openSans(
                                        color: AppTheme.black,
                                        fontSize: Constant.TextSize20(context),
                                        height: 1.5,
                                      ),
                                    )
                                        .animate(
                                          target: _controller.isMissionSection
                                              ? 1
                                              : 0,
                                        )
                                        .fadeIn(
                                          delay: 1400.ms,
                                          duration: 600.ms,
                                          curve: Curves.linear,
                                        )
                                  ],
                                )),
                            if (constraints.maxWidth > 800)
                              SizedBox(
                                  width:
                                      60), // Optional spacing between text and image

                            if (constraints.maxWidth < 800)
                              SizedBox(height: 30),
                            Expanded(
                              flex: constraints.maxWidth > 800 ? 6 : 0,
                              // Ensures the image respects the size constraints

                              child: Image.asset(
                                "assets/images/brain_processed.png",
                                fit: BoxFit.cover,
                              ),
                            )
                                .animate(
                                  target: _controller.isAboutuseVisble ? 1 : 0,
                                ) // Ensure animation triggers
                                .fadeIn(
                                    delay: 200.ms,
                                    duration: 600.ms,
                                    curve: Curves.linear),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Our Values",
                    style: GoogleFonts.bebasNeue(
                      color: AppTheme.black,
                      fontSize: Constant.subheadingText(context),
                      letterSpacing: 5,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    constraints: BoxConstraints(maxWidth: width),
                    child: VisibilityDetector(
                      key: Key("value"),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (info.visibleFraction > 0.05) {
                          _controller.changeisVlaueSection(true);
                        } // else {
                        //  _controller.changeisVlaueSection(false);
                        //   }
                      },
                      child: GridView.custom(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 0,
                          mainAxisExtent:
                              ResponsiveLayout.isMediumScreen(context)
                                  ? 200
                                  : ResponsiveLayout.isSmallScreen(context)
                                      ? 210
                                      : 200,
                          mainAxisSpacing: 0,
                          crossAxisCount:
                              ResponsiveLayout.isMediumScreen(context) ||
                                      ResponsiveLayout.isSmallScreen(context)
                                  ? 3
                                  : 5,
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: constraints.maxWidth > 800
                              ? valuesList.length
                              : 9,
                          (context, index) {
                            int totalColumns =
                                ResponsiveLayout.isMediumScreen(context) ||
                                        ResponsiveLayout.isSmallScreen(context)
                                    ? 3
                                    : 5;
                            int row =
                                index ~/ totalColumns; // Determine row number

                            // Movement logic
                            double beginY = (row == 0)
                                ? -100.0
                                : 100.0; // Top row moves down, bottom row moves up

                            return Container(
                              decoration: BoxDecoration(
                                color: index % 2 != 0
                                    ? Colors.transparent
                                    : AppTheme.black,
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    ResponsiveLayout.isLargeScreen(context)
                                        ? 30
                                        : 12,
                                horizontal:
                                    ResponsiveLayout.isLargeScreen(context)
                                        ? 30
                                        : 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${valuesList[index]["title"]}",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      color: index % 2 == 0
                                          ? AppTheme.whiteColor
                                          : AppTheme.black,
                                      fontSize: Constant.mediumbody(context),
                                    ),
                                  )
                                      .animate(
                                          target: _controller.isVlaueSection
                                              ? 1
                                              : 0)
                                      .then(
                                          delay: (Random().nextInt(10) * 100)
                                              .ms) // Staggered delay
                                      .fadeIn(delay: 1000.ms, duration: 800.ms),
                                  const SizedBox(height: 12),
                                  Text(
                                    "${valuesList[index]["details"]}",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w400,
                                      color: index % 2 == 0
                                          ? AppTheme.whiteColor
                                          : AppTheme.black,
                                      fontSize: 12,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                      .animate(
                                          target: _controller.isVlaueSection
                                              ? 1
                                              : 0)
                                      .then(
                                          delay: (Random().nextInt(10) * 100)
                                              .ms) // Staggered delay
                                      .fadeIn(delay: 1000.ms, duration: 800.ms),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            )
                                .animate(
                                    target: _controller.isVlaueSection
                                        ? 1
                                        : 0) // Start animation when visible

                                .fadeIn(
                                    duration: 400.ms) // Gradual fade-in effect
                                .moveY(
                                  begin:
                                      beginY, // Top row drops, bottom row rises
                                  end: 0,
                                  duration: 400.ms,
                                  curve: Curves.linear,
                                );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (constraints.maxWidth > 800)
                    SizedBox(
                      height: 80,
                    )
                  else
                    SizedBox(
                      height: 20,
                    ),
                 
                  // SizedBox(
                  //   height: 80,
                  // ),
                ],
              ),
              //                ).animate(target: _controller.isAboutuseVisble ? 1 : 0,) // Ensure animation triggers
              //  .moveY(begin: 300, end: 0, duration: 800.ms, curve: Curves.linear),
            ],
          ),
        );
      });
    });
  }

  // Widget buildRowSection(
  //     {required String imagePath,
  //     required String title,
  //     required String description,
  //     bool reverse = false,
  //     constraints,
  //     context}) {
  //   return Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           child: constraints.maxWidth > 800
  //               ? buildTextBigContent(title, description, context)
  //               : buildTextSmallContent(title, description, context),
  //         ),
  //         SizedBox(width: 60), // Optional spacing between text and image
  //         Expanded(
  //           // Ensures the image respects the size constraints

  //           child: Image.asset(
  //             imagePath,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ]);
  // }

  Widget buildTextBigContent(String title, String description, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.bebasNeue(
            color: AppTheme.black,
            fontSize: Constant.subheadingText(context),
            letterSpacing: 5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.openSans(
            color: AppTheme.black,
            fontSize: Constant.TextSize20(context),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "Our Mission",
          style: GoogleFonts.bebasNeue(
            color: AppTheme.black,
            fontSize: Constant.subheadingText(context),
            letterSpacing: 5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Our mission is to harness rigorous, interdisciplinary research and advanced engineering methodologies to drive transformative solutions for complex healthcare challenges,ultimately fostering equitable access and vibrant global health.",
          style: GoogleFonts.openSans(
            color: AppTheme.black,
            fontSize: Constant.TextSize20(context),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget buildTextSmallContent(String title, String description, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.bebasNeue(
            color: AppTheme.black,
            fontSize: Constant.subheadingText(context),
            letterSpacing: 5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.openSans(
            color: AppTheme.black,
            fontSize: Constant.mediumbody(context),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
