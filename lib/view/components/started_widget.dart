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

class StartedWidget extends StatelessWidget {
  const StartedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _started(context, 1200.0),
      // We will make this in a bit
      smallScreen: _started(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _started(context, 770.0),
    );
  }

  Widget _started(context, width) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return VisibilityDetector(
        onVisibilityChanged: (VisibilityInfo info) {
          print(info);
          if (info.visibleFraction > 0.1) {
            print("visible");
            _controller.changeOurStory(true); // o
          } 
        },
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           "assets/images/started.gif",
        //         ),
        //         alignment: Alignment.center,
        //         fit: BoxFit.cover,

        //         opacity: 0.4)),
        key: Key("value22"),
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/started.gif",
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomRight,
                ),
              )
                  .animate(target: _controller.isOurStory ? 1 : 0)
                  .fadeIn(delay: 200.ms, duration: 600.ms),

              // Additional Overlay Image

              Positioned.fill(
                  child: Container(color: const Color.fromARGB(167, 6, 6, 6))),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: width),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Our Story",
                        style: GoogleFonts.bebasNeue(
                            color: AppTheme.whiteColor,
                            fontSize: Constant.headingText(context),
                            letterSpacing: 5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Flexible(child:  buildText(
                              _controller.isOurStory ? 1 : 0, text1),)
                          // SizedBox(
                          //   width: 40,
                          // ),
                          // Expanded(
                          //   child: Container(
                          //     child: Column(
                          //       children: [
                          //         buildText(
                          //             _controller.isOurStory ? 1 : 0, text3),
                          //         SizedBox(
                          //           height: 30,
                          //         ),
                          //         buildText(
                          //             _controller.isOurStory ? 1 : 0, text4),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      // Container(
                      //   constraints: BoxConstraints(maxWidth: width),
                      //   child: Text(
                      //     "Archle Labs, founded by Alois Sajo Devasagayam, began taking shape during the COVID-19 pandemic to address critical gaps in healthcare, particularly for the elderly who struggled in isolation without proper support. The vision was deeply influenced by a firsthand experience of witnessing the sacrifices of a devoted caregiver tending to bedridden parents, revealing the silent hardships faced by those dedicating their lives to loved ones. This realization underscored the need for technology-driven solutions that extend beyond patient care to also empower caregivers. ",
                      //     style: GoogleFonts.openSans(
                      //         color: const Color.fromARGB(255, 255, 255, 255),
                      //         fontSize: Constant.TextSize20(context),
                      //         height: 2.5),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      // Container(
                      //   constraints: BoxConstraints(maxWidth: width),
                      //   child: Text(
                      //     "With an initial focus on remote elderly care, the venture gained momentum through the belief and guidance of a mentor-investor, whose untimely passing became a defining moment—transforming a promising idea into an unshakable mission to revolutionize healthcare accessibility. ",
                      //     style: GoogleFonts.openSans(
                      //         color: const Color.fromARGB(255, 255, 255, 255),
                      //         fontSize: Constant.TextSize20(context),
                      //         height: 2.5),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      // Container(
                      //   constraints: BoxConstraints(maxWidth: width),
                      //   child: Text(
                      //     "Despite numerous challenges, unwavering commitment propelled the venture forward. The expertise of key stakeholders refined the vision, while insights from medical professionals strengthened solution development. Strategic connections further opened doors to opportunities, enabling structured planning, product refinement, and system design. These collective efforts ultimately led to the creation of advanced, real-world healthcare solutions that bridge the gap between patient needs and caregiver support.",
                      //     style: GoogleFonts.openSans(
                      //         color: const Color.fromARGB(255, 255, 255, 255),
                      //         fontSize: Constant.TextSize20(context),
                      //         height: 2.5),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      // Container(
                      //   constraints: BoxConstraints(maxWidth: width),
                      //   child: Text(
                      //     "Now in the product development phase, the company is evolving with a dedicated core-team  committed to pioneering healthcare solutions. Attracting investor interest and strategic partnerships, it remains focused on refining innovations, expanding collaborations, and securing resources for full-scale implementation. What began as a spark of empathy is steadily transforming into a force for change, driven by a resolute commitment to making superior medical care accessible to all.",
                      //     style: GoogleFonts.openSans(
                      //         color: const Color.fromARGB(255, 255, 255, 255),
                      //         fontSize: Constant.TextSize20(context),
                      //         height: 2.5),
                      //     textAlign: TextAlign.start,
                      //   ),
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )
                      .animate(
                        target: _controller.isOurStory ? 1 : 0,
                      ) // Ensure animation triggers
                      .moveY(
                          begin: 300,
                          end: 0,
                          duration: 800.ms,
                          curve: Curves.linear),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

final String text1 = """
Archle Labs, founded by Alois Sajo Devasagayam, emerged during the COVID-19 pandemic to address critical gaps in,
healthcare particularly the silent struggles of the elderly and their caregivers. Inspired by the profound sacrifices of a 
 devoted caregiver tending to bedridden parents, the venture was driven by a vision to harness technology for transformative,
  human-centered healthcare solutions. With early momentum fueled by a mentor-investor’s belief—whose untimely passing
   became a defining catalyst—Archle Labs evolved from a promising concept into an unshakable mission to revolutionize
  healthcare accessibility. Despite formidable challenges, the unwavering commitment of key stakeholders,
   combined with medical expertise and strategic collaborations, refined the vision into tangible, real-world
    solutions bridging the gap between patient care and caregiver support. Now in the product development phase,
     the company continues to attract investor interest and forge strategic partnerships, relentlessly advancing its
      innovations toward full-scale implementation. What began as a spark of empathy is now a pioneering force,
       shaping the future of healthcare with a resolute commitment to making superior medical care universally accessible.
  """;

final String text2 =
    """What began as a spark of empathy is steadily transforming into a force for change,
 driven by a resolute commitment to making superior medical care accessible to all.With an initial focus on remote elderly care,
  the venture gained momentum through the belief and guidance of a mentor-investor, whose untimely passing became a defining 
  moment—transforming a promising idea into an unshakable mission to revolutionize healthcare accessibility. """;

final String text3 =
    """This realization underscored the need for technology-driven solutions
    that extend beyond patient care to also empower caregivers. Now in the product development
    phase, the company is evolving with a dedicated core-team  committed to pioneering healthcare solutions.
    Attracting investor interest and strategic partnerships, it remains focused on refining innovations, expanding
    collaborations, and securing resources for full-scale implementation. """;

final String text4 =
    """Despite numerous challenges, unwavering commitment propelled the venture forward.
    The expertise of key stakeholders refined the vision, while insights from medical
    professionals strengthened solution development. Strategic connections
    further opened doors to opportunities, enabling structured planning, product refinement,
    and system design. These collective efforts ultimately led to the creation of advanced, real-world 
  healthcare solutions that bridge the gap between patient needs and caregiver support. """;

buildText(isshow, text) {
  List<String> lines = text.split("\n"); // Split text into lines

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: lines.map((line) {
      int index = lines.indexOf(line);
      return Text(
        line.trim(),
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 20,
          height: 2.5,
        ),
        textAlign: TextAlign.justify,
      )
          .animate(target: isshow)
          .fadeIn(delay: (index * 500).ms) // Delay each line animation
          .moveY(begin: 50, end: 0, duration: 800.ms, curve: Curves.linear);
    }).toList(),
  );
}
