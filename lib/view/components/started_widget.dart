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
            height: 50,
          ),
          Text(
            "How it all started",
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
              "At Archle Labs, we’re on a mission to create a future of healthcare through  rigorous research, advanced engineering, and bold innovation. By uniting diverse expertise across the fields of science, technology, and medicine, we create transformative solutions that address the world’s most urgent medical challenges. Our approach is grounded in user-centric design and measurable outcomes, ensuring each innovation is both practical and accessible for healthcare professionals and patients alike. We combine visionary thinking with real-world implementation to bridge gaps in modern healthcare, aiming to positively impact communities on a global scale.",
              style: GoogleFonts.openSans(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: Constant.smallbheadingText(context),
                  height: 2.5),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
           Container(
             constraints: BoxConstraints(maxWidth: width),
            child: Text(
            "We revolutionize healthcare with rigorous research and bold innovation. By merging expertise across science, technology, and medicine, we create transformative solutions that tackle the world’s most urgent medical challenges, driving scalable, real-world impact. ",
            style: GoogleFonts.openSans(
                 color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: Constant.smallbheadingText(context),
                height: 2.5),
            textAlign: TextAlign.center,
          ),),
           SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
