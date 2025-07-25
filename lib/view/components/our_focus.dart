import 'package:archlelabswebsite/view/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
    // {
    //   "title": "ADL Technologies",
    //   "details":
    //       "Designing innovative systems to enhance independence and quality of life by assisting with Activities of Daily Living."
    // },
    // {
    //   "title": "Advanced Triage & PHS",
    //   "details":
    //       "Equipping clinicians with efficient and responsive triage platforms that prioritize patient needs and deliver timely, high-quality care."
    // },
    // {
    //   "title": "Comprehensive Out Patient services ",
    //   "details":
    //       "Leveraging technology to transform outpatient care, optimizing resource allocation, and reducing wait times for enhanced operational efficiency."
    // }
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
            color: Color.fromRGBO(243, 243, 243, 1),
            child: Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/aeonbg.png",
                    fit: BoxFit.cover,
                    height: 600,
                  ),
                ),
                Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Our Intelligent Healthcare Super app",
                                  style: GoogleFonts.quicksand(
                                      color: AppTheme.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          Constant.textFourtyEight(context),
                                      ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  height: 4,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(17, 196, 48, 1)),
                                ),
                              ],
                            ),
                            // Image.asset(
                            //   "assets/images/aeon.png",
                            //   width: constraints.maxWidth > 800 ? 300 : 150,
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Flex(
                          direction: constraints.maxWidth > 800
                              ? Axis.horizontal
                              : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                              Expanded(
                                  flex: constraints.maxWidth > 800 ? 4 : 0,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(
                                      "assets/images/aeon.png",
                                      height:
                                          constraints.maxWidth > 800 ? 200 : 80,
                                    ),
                                  )),
                            if (constraints.maxWidth > 800)
                              SizedBox(
                                  width:
                                      40), // Optional spacing between text and image

                            if (constraints.maxWidth < 800)
                              SizedBox(height: 30),
                            Expanded(
                              flex: constraints.maxWidth > 800 ? 8 : 0,
                              child: Text(
                                "Aeon Lyf now in active development at Archle Labs, is a privacy‑first mobile health platform that unifies diagnostics, medication fulfilment, lifestyle coaching, and mental‑health support in a single app. It is powered by Mother AI, an in‑house enhanced suite of open‑source language and vision models deployed in a secure, privacy‑preserving cloud environment to deliver low‑latency, clinically relevant guidance. These models are continuously fine‑tuned on anonymised clinical datasets and improved through clinician‑in‑the‑loop feedback to maintain accuracy, safety, and bias control.",
                                style: GoogleFonts.openSans(
                                  color: Color.fromRGBO(69, 69, 69, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: Constant.body(context),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 60,
                        ),
                        Flex(
                          direction: constraints.maxWidth > 800
                              ? Axis.horizontal
                              : Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: constraints.maxWidth > 800 ? 6 : 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: AppTheme.black,
                                              shape: BoxShape.circle),
                                          height: 4,
                                          width: 4,
                                        ),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            "AI Doctor: 24/7 symptom assessments, prescription recommendations, and automated follow-up care",
                                            style: GoogleFonts.openSans(
                                              color:
                                                  Color.fromRGBO(69, 69, 69, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Constant.body(context),
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: AppTheme.black,
                                              shape: BoxShape.circle),
                                          height: 4,
                                          width: 4,
                                        ),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            "AI Therapist: Confidential mental wellness support through evidence-based chats and mood tracking.",
                                            style: GoogleFonts.openSans(
                                              color:
                                                  Color.fromRGBO(69, 69, 69, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Constant.body(context),
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: AppTheme.black,
                                              shape: BoxShape.circle),
                                          height: 4,
                                          width: 4,
                                        ),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            "AI Nutritionist: Photo-based meal analysis, nutrition insights, allergy alerts, and personalised dietary recommendations.",
                                            style: GoogleFonts.openSans(
                                              color:
                                                  Color.fromRGBO(69, 69, 69, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Constant.body(context),
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          decoration: BoxDecoration(
                                              color: AppTheme.black,
                                              shape: BoxShape.circle),
                                          height: 4,
                                          width: 4,
                                        ),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Text(
                                            "AI Fitness Trainer: Adaptive workout plans tailored to your fitness data, wearable inputs, and daily schedule.",
                                            style: GoogleFonts.openSans(
                                              color:
                                                  Color.fromRGBO(69, 69, 69, 1),
                                              fontWeight: FontWeight.w600,
                                              fontSize: Constant.body(context),
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (constraints.maxWidth > 800)
                              SizedBox(
                                  width:
                                      100), // Optional spacing between text and image

                            if (constraints.maxWidth < 800)
                              SizedBox(height: 30),
                            Expanded(
                                flex: constraints.maxWidth > 800 ? 6 : 0,
                                child: Row(
                                  mainAxisAlignment: constraints.maxWidth > 800
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/mob3.png",
                                      height: 400,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        // SizedBox(
                        //   height: 60,
                        // ),
                        // Text(
                        //   "Coming Soon",
                        //   style: GoogleFonts.bebasNeue(
                        //       color: AppTheme.whiteColor,
                        //       fontSize: Constant.headingText(context),
                        //       letterSpacing: 5),
                        //   textAlign: TextAlign.center,
                        // ),
                        // SizedBox(
                        //   height: 70,
                        // ),
                        // Align(
                        //   alignment: Alignment.topLeft,
                        //   child: Container(
                        //     constraints: BoxConstraints(maxWidth: 700),
                        //     child: GridView.custom(
                        //       shrinkWrap: true,
                        //       physics: NeverScrollableScrollPhysics(),
                        //       gridDelegate:
                        //           SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisSpacing: 0,
                        //         //  tileBottomSpace: 20,

                        //         mainAxisExtent:
                        //             ResponsiveLayout.isMediumScreen(context)
                        //                 ? 280
                        //                 : ResponsiveLayout.isSmallScreen(context)
                        //                     ? 320
                        //                     : 336,
                        //         mainAxisSpacing: 0,

                        //         crossAxisCount:
                        //             ResponsiveLayout.isMediumScreen(context) ||
                        //                     ResponsiveLayout.isSmallScreen(context)
                        //                 ? 2
                        //                 : 2,
                        //       ),
                        //       childrenDelegate: SliverChildBuilderDelegate(
                        //         childCount: valuesList.length,
                        //         (context, index) {
                        //           var animation = index % 4 == 0
                        //               ? (w) => w.moveX(
                        //                   begin: -50,
                        //                   end: 0,
                        //                   duration: 400.ms) // Left to Center
                        //               : index % 4 == 1
                        //                   ? (w) => w.moveX(
                        //                       begin: 50,
                        //                       end: 0,
                        //                       duration: 400.ms) // Right to Center
                        //                   : index % 4 == 2
                        //                       ? (w) => w.moveY(
                        //                           begin: -50,
                        //                           end: 0,
                        //                           duration: 400.ms) // Top to Center
                        //                       : (w) => w.moveY(
                        //                           begin: 50,
                        //                           end: 0,
                        //                           duration:
                        //                               400.ms); // Bottom to Center

                        //           return Container(
                        //             decoration: BoxDecoration(
                        //                 color: index == 0 || index == 3
                        //                     ? Colors.white
                        //                     : AppTheme.black),
                        //             padding: EdgeInsets.symmetric(
                        //                 horizontal:
                        //                     ResponsiveLayout.isLargeScreen(context)
                        //                         ? 50
                        //                         : 20),
                        //             child: Column(
                        //               crossAxisAlignment: CrossAxisAlignment.start,
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 Text(
                        //                   "${valuesList[index]["title"]}",
                        //                   style: GoogleFonts.openSans(
                        //                     fontWeight: FontWeight.w700,
                        //                     color: index == 1 || index == 2
                        //                         ? AppTheme.whiteColor
                        //                         : AppTheme.black,
                        //                     fontSize:
                        //                         Constant.smallbheadingText(context),
                        //                   ),
                        //                 )
                        //                     .animate(
                        //                         target:
                        //                             _controller.isOurFocus ? 1 : 0)
                        //                     .fadeIn(
                        //                         delay: 1000.ms, duration: 800.ms),
                        //                 const SizedBox(
                        //                   height: 12,
                        //                 ),
                        //                 Text(
                        //                   "${valuesList[index]["details"]}",
                        //                   style: GoogleFonts.openSans(
                        //                     fontWeight: FontWeight.w400,
                        //                     color: index == 1 || index == 2
                        //                         ? AppTheme.whiteColor
                        //                         : AppTheme.black,
                        //                     fontSize: Constant.mediumbody(context),
                        //                   ),
                        //                 )
                        //                     .animate(
                        //                         target:
                        //                             _controller.isOurFocus ? 1 : 0)
                        //                     .fadeIn(
                        //                         delay: 1000.ms, duration: 800.ms),
                        //               ],
                        //             ),
                        //           )
                        //               .animate(
                        //                   target: _controller.isOurFocus
                        //                       ? 1
                        //                       : 0) // Ensures smooth animation
                        //               .move(
                        //                 delay: index % 4 == 0
                        //                     ? 0.ms
                        //                     : // Left to Center
                        //                     index % 4 == 1
                        //                         ? 400.ms
                        //                         : // Right to Center
                        //                         index % 4 == 2
                        //                             ? 800.ms
                        //                             : 1200.ms,
                        //                 begin: index % 4 == 0
                        //                     ? Offset(-300, 0)
                        //                     : // Left to Center
                        //                     index % 4 == 1
                        //                         ? Offset(300, 0)
                        //                         : // Right to Center
                        //                         index % 4 == 2
                        //                             ? Offset(-300, 0)
                        //                             : // Top to Center
                        //                             Offset(
                        //                                 300, 0), // Bottom to Center
                        //                 end: Offset.zero,
                        //                 duration: 500.ms,
                        //                 curve: Curves.linear,
                        //               )
                        //               .fadeIn(
                        //                   duration: 400.ms,
                        //                   curve: Curves
                        //                       .easeOut); // Add fade-in for better effect
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 100,
                        // ),
                        // Container(
                        //   constraints: BoxConstraints(maxWidth: width),
                        //   child: Text(
                        //     "Next- gen medical device, leveraging technology to transform healthcare access and reduce wait times for enhanced operational efficiency.",
                        //     style: GoogleFonts.openSans(
                        //         fontWeight: FontWeight.w300,
                        //         color: const Color.fromARGB(255, 255, 255, 255),
                        //         fontSize: Constant.TextSize20(context),
                        //         height: 1.5),
                        //     textAlign: TextAlign.justify,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 50,
                        // ),
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
                        // SizedBox(
                        //   height: 50,
                        // ),
                        // Text(
                        //   "Global Impact through equitable health",
                        //   style: GoogleFonts.bebasNeue(
                        //     color: AppTheme.whiteColor,
                        //     fontWeight: FontWeight.w500,
                        //     letterSpacing: 5,
                        //     fontSize: Constant.subheadingText(context),
                        //   ),
                        // ),
                        const SizedBox(height: 40),
                        Container(constraints: BoxConstraints(maxWidth: 800),
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.quicksand(
                                color: Color.fromRGBO(69, 69, 69, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: Constant.body(context),
                                height: 1.5,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'Archle Labs continues to refine Aeon Lyf through rigorous testing in real‑world clinical settings. For technical briefs or collaboration enquiries, please contact info@archlelabs.com or visit our site ',
                                ),
                                TextSpan(
                                  text: 'Aeon Lyf',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.darkprimaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchUrl(
                                        Uri.parse('https://aeonlyf.com'),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    },
                                ),
                                const TextSpan(text: '.'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
