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

class OurProduct extends StatelessWidget {
  OurProduct({super.key});

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
          key: Globals.container5Key,
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
                    Text(
                      "Mother AI",
                      style: GoogleFonts.quicksand(
                          color: AppTheme.whiteColor,
                          fontWeight: FontWeight.w700,
                          fontSize: Constant.textFourtyEight(context),
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flex(
                      direction: constraints.maxWidth > 800
                          ? Axis.horizontal
                          : Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: constraints.maxWidth > 800 ? 5 : 0,
                            child: Align(alignment: Alignment.centerLeft,
                              child: Image.asset(
                                "assets/images/mothrai.png",
                               height: 300,
                              ),
                            )),
                        if (constraints.maxWidth > 800)
                          SizedBox(
                              width:
                                  60), // Optional spacing between text and image

                        if (constraints.maxWidth < 800) SizedBox(height: 30),
                        Expanded(
                          flex: constraints.maxWidth > 800 ? 6 : 0,
                          child: Text(
                            "Archle Labs has launched Mother AI as a strategic R&D venture to accelerate discovery, harness global community expertise, and democratize access to advanced healthcare AI. By openly releasing every line of code and model weight, we eliminate commercial gatekeeping and empower clinicians, researchers, and developers everywhere to customize privacy preserving language and vision models for their local contexts, from on-device diagnostics and triage chatbots to population health forecasting. Our mission is clear: ensure that no community is left behind by technology and that equitable, high quality care becomes a universal standard.",
                            style: GoogleFonts.openSans(
                              color: AppTheme.whiteColor,
                              fontWeight: FontWeight.w300,
                              fontSize: Constant.body(context),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
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
