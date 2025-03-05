import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          "We push boundaries to create breakthrough healthcare solutions"
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
          "We innovate ethically, minimizing environmental impact and improving public health"
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
      "details": "We ensure accuracy and consistency in every solution"
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
      return Container(
        key: Globals.container1Key,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            // Background GIF
            Positioned(
              top: 0,
              bottom:500,
              right:0,
              left:0,
              child: Image.asset(
                "assets/images/about.gif",
                fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.4),
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

            // Content Section
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: width),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (constraints.maxWidth > 800)
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                width: 350,
                                height: 500,
                                "assets/images/space2.png",
                                fit: BoxFit.fitHeight,
                              ),
                              Positioned(
                                top: 120,
                                right: -370,
                                child: Text(
                                  "About Us",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constant.bigFont94(context),
                                    letterSpacing: 3,
                                  ),
                                ),
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
                              const SizedBox(height: 180),
                              if (constraints.maxWidth < 800)
                                Text(
                                  "About Us",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constant.bigFont94(context),
                                    letterSpacing: 3,
                                  ),
                                ),
                              const SizedBox(height: 20),
                              Text(
                                "Archle Labs is an advanced research center for health and life sciences engineering, committed to revolutionizing the healthcare field. We combine cutting-edge technology, interdisciplinary expertise fueled by  unwavering passion for innovation to tackle the world’s most pressing medical challenges. By developing novel solutions and services, we aim to elevate human health, enhance patient outcomes, and transform global healthcare practices.",
                                style: GoogleFonts.openSans(
                                  color: AppTheme.black,
                                  fontSize: Constant.TextSize20(context),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    const SizedBox(height: 50),
                    Text(
                      "Our Values",
                      style: GoogleFonts.bebasNeue(
                        color: AppTheme.black,
                        fontSize: Constant.subheadingText(context),
                        letterSpacing: 5,
                      ),
                    ),  const SizedBox(height: 50),
                    GridView.custom(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 0,
                        //  tileBottomSpace: 20,
                        mainAxisExtent: ResponsiveLayout.isMediumScreen(context)
                            ? 200
                            : ResponsiveLayout.isSmallScreen(context)
                                ? 280
                                : 200,
                        mainAxisSpacing: 0,
                        crossAxisCount:
                            ResponsiveLayout.isMediumScreen(context) ||
                                    ResponsiveLayout.isSmallScreen(context)
                                ? 3
                                : 5,
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: valuesList.length,
                        (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: index % 2 != 0
                                    ? Colors.transparent
                                    : AppTheme.black),
                                    padding: EdgeInsets.symmetric(vertical: ResponsiveLayout.isLargeScreen(context)?30: 12, horizontal: ResponsiveLayout.isLargeScreen(context)?30: 12),
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
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "${valuesList[index]["details"]}",
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w400,
                                    color: index % 2 == 0
                                        ? AppTheme.whiteColor
                                        : AppTheme.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                 SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Our team of scientists, engineers, and healthcare professionals works collaboratively to expand the horizons of diagnostics, therapeutics, and primary care services/ comprehensive care services. Through rigorous research, forward-thinking partnerships, and a relentless drive for breakthroughs, we continuously push the boundaries of healthcare and medical science—creating transformative technologies that will redefine patient care worldwide.",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontSize: Constant.mediumbody(context),
                        height: 2,
                      ),
                    
                    ),
                    SizedBox(
                      height: 80,
                    ),
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
            child: constraints.maxWidth > 800
                ? buildTextBigContent(title, description, context)
                : buildTextSmallContent(title, description, context),
          ),
          SizedBox(width: 60), // Optional spacing between text and image
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
          "Our mission is to harness rigorous, interdisciplinary research and advanced engineering methodologies to drive transformative solutions for complex healthcare challenges—ultimately fostering equitable access and vibrant global health.",
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
