import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
    width: double.infinity,
      //  constraints: BoxConstraints(maxWidth: width),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/started.gif",
              ),
              alignment: Alignment.center,
              fit: BoxFit.cover,
              opacity: 0.36)),
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
          Container(
             constraints: BoxConstraints(maxWidth: width),
            child: Text(
              "Archle Labs, founded by Alois Sajo Devasagayam, began taking shape during the COVID-19 pandemic to address critical gaps in healthcare, particularly for the elderly who struggled in isolation without proper support. The vision was deeply influenced by a firsthand experience of witnessing the sacrifices of a devoted caregiver tending to bedridden parents, revealing the silent hardships faced by those dedicating their lives to loved ones. This realization underscored the need for technology-driven solutions that extend beyond patient care to also empower caregivers. ",
              style: GoogleFonts.openSans(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: Constant.TextSize20(context),
                  height: 2.5),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 30,
          ),
           Container(
             constraints: BoxConstraints(maxWidth: width),
            child: Text(
            "With an initial focus on remote elderly care, the venture gained momentum through the belief and guidance of a mentor-investor, whose untimely passing became a defining moment—transforming a promising idea into an unshakable mission to revolutionize healthcare accessibility. ",
            style: GoogleFonts.openSans(
                 color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: Constant.TextSize20(context),
                height: 2.5),
            textAlign: TextAlign.start,
          ),),
           SizedBox(
            height: 30,
          ),
           Container(
             constraints: BoxConstraints(maxWidth: width),
            child: Text(
            "Despite numerous challenges, unwavering commitment propelled the venture forward. The expertise of key stakeholders refined the vision, while insights from medical professionals strengthened solution development. Strategic connections further opened doors to opportunities, enabling structured planning, product refinement, and system design. These collective efforts ultimately led to the creation of advanced, real-world healthcare solutions that bridge the gap between patient needs and caregiver support.",
            style: GoogleFonts.openSans(
                 color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: Constant.TextSize20(context),
                height: 2.5),
           textAlign: TextAlign.start,
          ),),
           SizedBox(
            height: 30,
          ),
           Container(
             constraints: BoxConstraints(maxWidth: width),
            child: Text(
            "Now in the product development phase, the company is evolving with a dedicated core-team  committed to pioneering healthcare solutions. Attracting investor interest and strategic partnerships, it remains focused on refining innovations, expanding collaborations, and securing resources for full-scale implementation. What began as a spark of empathy is steadily transforming into a force for change, driven by a resolute commitment to making superior medical care accessible to all.",
            style: GoogleFonts.openSans(
                 color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: Constant.TextSize20(context),
                height: 2.5),
            textAlign: TextAlign.start,
          ),),
          
           SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
