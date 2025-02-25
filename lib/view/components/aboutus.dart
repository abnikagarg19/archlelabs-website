import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../responsive/layouts.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/globals.dart';

class AboutusWidget extends StatelessWidget {
  const AboutusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _aboutus(context, 1200.0),
      // We will make this in a bit
      smallScreen: _aboutus(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _aboutus(context, 770.0),
    );
  }

  Widget _aboutus(context, width) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        key: Globals.container1Key,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            // Background GIF
            Positioned.fill(
              child: Image.asset(
                "assets/images/about us.gif",
                fit: BoxFit.cover,
                opacity: AlwaysStoppedAnimation(0.2), // Adjust transparency
              ),
            ),

            // Additional Overlay Image
            Positioned.fill(
              child: Image.asset(
                "assets/images/gradient.png",
                fit: BoxFit.cover,
              ),
            ),

            // Content Section
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: width),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      "About Us",
                      style: GoogleFonts.bebasNeue(
                        color: AppTheme.black,
                        fontSize: Constant.headingText(context),
                        letterSpacing: 5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Archle Labs is an advanced research center for health and life sciences engineering, committed to revolutionizing the healthcare field. We combine cutting-edge technology, interdisciplinary expertise fueled by  unwavering passion for innovation to tackle the world’s most pressing medical challenges. By developing novel solutions and services, we aim to elevate human health, enhance patient outcomes, and transform global healthcare practices.",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontSize: Constant.mediumbody(context),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    buildRowSection(
                        imagePath: "assets/images/space.png",
                        title: "OUR VALUES",
                        description:
                            "To revolutionize medical science, forging a future where no challenge is insurmountable and every life thrives.",
                        constraints: constraints,
                        context: context),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Our team of scientists, engineers, and healthcare professionals works collaboratively to expand the horizons of diagnostics, therapeutics, and primary care services/ comprehensive care services. Through rigorous research, forward-thinking partnerships, and a relentless drive for breakthroughs, we continuously push the boundaries of healthcare and medical science—creating transformative technologies that will redefine patient care worldwide.",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontSize: Constant.mediumbody(context),
                        height: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildRowSection(
      {required String imagePath,
      required String title,
      required String description,
      bool reverse = false,
      constraints,
      context}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Expanded(
            child:constraints.maxWidth>800? buildTextBigContent(title, description, context): buildTextSmallContent(title, description, context),
          ),
          SizedBox(width: 40), // Optional spacing between text and image
          Expanded(
            // Ensures the image respects the size constraints

            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ]);
  }

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
            fontSize: Constant.mediumbody(context),
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
