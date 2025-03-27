import 'package:archlelabswebsite/view/home.dart';
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

class OurFocus extends StatelessWidget {
  OurFocus({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _ourFocus(context, 1200.0),
      // We will make this in a bit
      smallScreen: _ourFocus(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _ourFocus(context, 770.0),
    );
  }

  List valuesList = [
    {
      "title": "Diagnostic Devices",
      "details":
          "Developing advanced, user-friendly diagnostic tools that enable swift and accurate detection of critical health conditions"
    },
    {
      "title": "ADL Technologies",
      "details":
          "Designing innovative systems to enhance independence and quality of life by assisting with Activities of Daily Living."
    },
    {
      "title": "Advanced Triage & PHS",
      "details":
          "Equipping clinicians with efficient and responsive triage platforms that prioritize patient needs and deliver timely, high-quality care."
    },
    {
      "title": "Comprehensive Out Patient services ",
      "details":
          "Leveraging technology to transform outpatient care, optimizing resource allocation, and reducing wait times for enhanced operational efficiency."
    }
  ];
  Widget _ourFocus(context, width) {
    return LayoutBuilder(builder: (context, constraints) {
      return GetBuilder<HomeController>(builder: (_controller) {
        return VisibilityDetector(
          onVisibilityChanged: (VisibilityInfo info) {
            print(info);
            if (info.visibleFraction > 0.2) {
              print("visible");
              _controller.changeisOurFocus(); // o
            } //else {
             // _controller.changeisOurFocusNot(); // o
           // }
          },
          key: Globals.container4Key,
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(15, 15, 15, 1)),
            width: double.infinity,
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        "Our Focus",
                        style: GoogleFonts.bebasNeue(
                            color: AppTheme.whiteColor,
                            fontSize: Constant.headingText(context),
                            letterSpacing: 5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: GridView.custom(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            //  tileBottomSpace: 20,

                            mainAxisExtent:
                                ResponsiveLayout.isMediumScreen(context)
                                    ? 280
                                    : ResponsiveLayout.isSmallScreen(context)
                                        ? 320
                                        : 336,
                            mainAxisSpacing: 0,

                            crossAxisCount:
                                ResponsiveLayout.isMediumScreen(context) ||
                                        ResponsiveLayout.isSmallScreen(context)
                                    ? 2
                                    : 2,
                          ),
                          childrenDelegate: SliverChildBuilderDelegate(
                            childCount: valuesList.length,
                            (context, index) {
                              var animation = index % 4 == 0
                                  ? (w) => w.moveX(
                                      begin: -50,
                                      end: 0,
                                      duration: 400.ms) // Left to Center
                                  : index % 4 == 1
                                      ? (w) => w.moveX(
                                          begin: 50,
                                          end: 0,
                                          duration: 400.ms) // Right to Center
                                      : index % 4 == 2
                                          ? (w) => w.moveY(
                                              begin: -50,
                                              end: 0,
                                              duration: 400.ms) // Top to Center
                                          : (w) => w.moveY(
                                              begin: 50,
                                              end: 0,
                                              duration:
                                                  400.ms); // Bottom to Center

                              return Container(
                                decoration: BoxDecoration(
                                    color: index == 0 || index == 3
                                        ? Colors.white
                                        : AppTheme.black),
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ResponsiveLayout.isLargeScreen(context)
                                            ? 50
                                            : 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${valuesList[index]["title"]}",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        color: index == 1 || index == 2
                                            ? AppTheme.whiteColor
                                            : AppTheme.black,
                                        fontSize:
                                            Constant.smallbheadingText(context),
                                      ),
                                    )
                                        .animate(
                                            target:
                                                _controller.isOurFocus ? 1 : 0)
                                        .fadeIn(
                                            delay: 1000.ms, duration: 800.ms),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "${valuesList[index]["details"]}",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w400,
                                        color: index == 1 || index == 2
                                            ? AppTheme.whiteColor
                                            : AppTheme.black,
                                        fontSize: Constant.mediumbody(context),
                                      ),
                                    )
                                        .animate(
                                            target:
                                                _controller.isOurFocus ? 1 : 0)
                                        .fadeIn(
                                            delay: 1000.ms, duration: 800.ms),
                                  ],
                                ),
                              )
                                  .animate(
                                      target: _controller.isOurFocus
                                          ? 1
                                          : 0) // Ensures smooth animation
                                  .move(
                                    delay: index % 4 == 0
                                        ? 0.ms
                                        : // Left to Center
                                        index % 4 == 1
                                            ? 400.ms
                                            : // Right to Center
                                            index % 4 == 2
                                                ? 800.ms
                                                : 1200.ms,
                                    begin: index % 4 == 0
                                        ? Offset(-300, 0)
                                        : // Left to Center
                                        index % 4 == 1
                                            ? Offset(300, 0)
                                            : // Right to Center
                                            index % 4 == 2
                                                ? Offset(-300, 0)
                                                : // Top to Center
                                                Offset(
                                                    300, 0), // Bottom to Center
                                    end: Offset.zero,
                                    duration: 500.ms,
                                    curve: Curves.linear,
                                  )
                                  .fadeIn(
                                      duration: 400.ms,
                                      curve: Curves
                                          .easeOut); // Add fade-in for better effect
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    // Text(
                    //   "Cutting-Edge Research",
                    //   style: GoogleFonts.bebasNeue(
                    //     color: AppTheme.whiteColor,
                    //     fontWeight: FontWeight.w500,
                    //     letterSpacing: 5,
                    //     fontSize: Constant.subheadingText(context),
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    // Text(
                    //   "We blend interdisciplinary thinking and frontier technologies to accelerate breakthroughs in diagnostics, therapeutics, and primary care.",
                    //   style: GoogleFonts.openSans(
                    //     color: AppTheme.whiteColor,
                    //     fontWeight: FontWeight.w300,
                    //     fontSize: Constant.TextSize20(context),
                    //     height: 1.5,
                    //   ),
                    // ),
                     Container(
                    constraints: BoxConstraints(maxWidth: width),
                    child: Text(
                      "Our team of scientists, engineers, and healthcare professionals works collaboratively to expand the horizons of diagnostics, therapeutics, and primary care services comprehensive care services. Through rigorous research, forward-thinking partnerships, and a relentless drive for breakthroughs, we continuously push the boundaries of healthcare and medical science,creating transformative technologies that will redefine patient care worldwide.",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: Constant.TextSize20(context),
                          height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                    SizedBox(
                      height: 50,
                    ),
                    // Text(
                    //   "Global Impact through equitable health",
                    //   style: GoogleFonts.bebasNeue(
                    //     color: AppTheme.whiteColor,
                    //     fontWeight: FontWeight.w500,
                    //     letterSpacing: 5,
                    //     fontSize: Constant.subheadingText(context),
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    // Text(
                    //   "Redefine healthcare with scalable, sustainable models that transcend financial and geographical barriers. By fusing advanced technology with a human-first approach, we close critical gaps in access, delivering equitable, high-impact medical solutions.",
                    //   style: GoogleFonts.openSans(
                    //       fontWeight: FontWeight.w300,
                    //       color: const Color.fromARGB(255, 255, 255, 255),
                    //       fontSize: Constant.TextSize20(context),
                    //       height: 1.5),
                    // ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                     SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
