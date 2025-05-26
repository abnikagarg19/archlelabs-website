import 'dart:math';
import 'package:archlelabswebsite/utils/globals.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../controller/homeController.dart';
import '../../responsive/layouts.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';

class TeamWidget extends StatefulWidget {
  const TeamWidget({
    super.key,
  });

  @override
  State<TeamWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends State<TeamWidget> {
  bool isHover = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _team(context, 1200),
      // We will make this in a bit
      smallScreen: _team(context, MediaQuery.of(context).size.width * .7),
      mediumScreen: _team(context, 770.0),
    );
  }

  launchurl(emailLaunchUri) async {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch email client');
    }
  }

  final teamList = [
    {
      "name": "Dr. J. Amalorpavanathan",
      "designation": "Chief Medical Advisor",
      "linkedin": "",
      "image": "assets/team/dr.png",
      "des":
          "Dr. J. Amalorpavanathan, a distinguished Vascular Surgeon and Organ Transplant Administrator, brings two decades of clinical excellence in vascular surgery and led the Tamil Nadu Government’s organ transplant program from 2008 to 2016. With qualifications including MBBS, MS, DNB, and MCh in Vascular Surgery, he integrates advanced medical expertise with strategic leadership and a strong commitment to public health. Known for driving innovation and inspiring teams through the motto “Nothing is Impossible,” he fosters a culture of perseverance, continuous learning, and purpose-driven care."
    }
  ];

  final teamList2 = [
    {
      "name": "Alois D Sajo",
      "designation": "Founder/CEO",
      "linkedin": "https://www.linkedin.com/in/aloissajodevasagayam/",
      "image": "assets/team/alois_edit.webp",
      "des":
          "Alois Sajo, Founder and CEO of Archle Labs, is dedicated to creating meaningful social impact through innovative healthcare solutions. Leading a company at the forefront of redefining healthcare, he expertly integrates strategy, product development, and user experience design to deliver transformative market solutions. His journey includes leading successful social enterprises, developing effective market strategies, and building high-performing teams driven by curiosity and a commitment to first-principle thinking. When not focused on advancing the next breakthrough, he pursues interests in history, cultural exploration, and the fields of science and philosophy. Driven by a belief that true innovation stems from a willingness to challenge conventional thinking, he is deeply committed to making a lasting and positive impact."
    },
    {
      "name": "Dr.Siri Karthika R",
      "designation": "Health Director",
      "linkedin": "www.linkedin.com/in/siri-karthika",
      "image": "assets/team/siri_edit.jpg",
      "des":
          "Dr. Siri Karthika, an MBBS graduate and University Rank holder in Pediatrics, combines her medical expertise with a deep commitment to improving community health, ensuring that her research directly addresses the needs of underserved populations. Driven by a passion for advancing knowledge in epigenetics, neuroscience, and human behavior, she focuses on how these fields can enhance public health outcomes. Outside of her research, she is dedicated to promoting wellness—whether through fitness, exploring nutrition, or engaging with local health initiatives."
    },
    {
      "name": "Joel Prithvi Ignatius",
      "designation": "Data Scientist",
      "linkedin": "https://www.linkedin.com/in/joel-prithvi/",
      "image": "assets/team/joel_edit.jpg",
      "des":
          "Joel, a Data Scientist with a Master's in Big Data and Business Analytics, specializes in transforming raw data into actionable insights, building machine learning models, and automating processes to solve real-world challenges. He has contributed to cost-reduction initiatives at a Fortune 500 company. Outside of work, he finds balance through diverse interests—playing guitar (with over 100 performances), shooting hoops, and immersing himself in anime—all of which fuel his creativity and drive."
    },
    {
      "name": "Tejas Prataprao Chavan",
      "designation": "R&D Mechatronics engineer",
      "linkedin": "https://www.linkedin.com/in/tejaspchavan",
      "image": "assets/team/tejas_edit.jpg",
      "des":
          "Tejas Chavan seamlessly integrates robotics, embedded systems, and AI-driven automation to create intelligent, high-performance solutions. From designing intricate circuits to developing full-scale prototypes, he consistently bridges the gap between mechanics and advanced technology. With a range of published research, design accolades, and innovative contributions, he approaches complex challenges with a diverse skill set and a relentless drive for practical innovation."
    },
    // {
    //   "name": "Antara",
    //   "designation": "UX/UI Designer",
    //   "linkedin": "https://www.linkedin.com/in/antara-banik/",
    //   "image": "assets/team/antara_edit.jpg",
    //   "des":
    //       "Antara approaches design with empathy, curiosity, and a meticulous attention to detail. Specializing in understanding human behavior, she transforms complex concepts into seamless, intuitive experiences. Outside of her design work, she is deeply engaged in studying psychology and exploring color theory. She believes that great design goes beyond aesthetics—it's about creating meaningful, impactful experiences that truly resonate with users."
    // },
    {
      "name": "Abnika Garg",
      "designation": "Flutter Developer",
      "linkedin": "https://www.linkedin.com/in/abnika-garg-135b0a165/",
      "image": "assets/team/abnika_edit.jpeg",
      "des":
          "Abnika Garg is a Flutter Developer who builds sleek, high-performing applications with a strong focus on user experience and backend efficiency. With a B.Tech in Electronics and Communication Engineering, she specializes in crafting responsive user interfaces, integrating real-time features, and developing robust APIs. Outside of development, she stays curious—exploring emerging technologies, tackling complex puzzles, and continuously striving to create innovative and impactful digital solutions."
    },
    // {
    //   "name": "Dr.Suneera C M",
    //   "designation": "Principle NLP Scientist",
    //   "linkedin": "https://www.linkedin.com/in/suneera-c-moideen/",
    //   "image": "assets/team/suneera_edit.jpg",
    //   "des":
    //       "Dr. Suneera, Principal NLP Scientist, leads the AI team in developing intelligent, user-centric healthcare communication systems. With a PhD from NIT Calicut and six years of research experience, she brings both depth and innovation to her work. Honored with accolades like the ACM India Anveshan Setu Fellowship, she seamlessly blends academic rigor with practical application to deliver impactful solutions in the healthcare AI space."
    // },
    {
      "name": "Mohan Raja",
      "designation": "Application Developer",
      "linkedin": "https://www.linkedin.com/in/mogeoeg2224/",
      "image": "assets/team/mohan_edit.jpg",
      "des":
          "Mohan Raj, an Application Developer, specializes in transforming complex backend challenges into seamless, efficient solutions. He has contributed to projects for organizations such as Marsh Insurance and FedEx, and holds certifications in Microsoft AI, AWS, and CockroachDB. In recognition of his innovative work in customer experience, he received the 2023 IAF Young Entrepreneur Award for CX.",
    },
    // {
    //   "name": "Bhavya Minocha",
    //   "designation": "Embedded Systems Engineer",
    //   "linkedin": "https://www.linkedin.com/in/bhavya-minocha-17101022a/",
    //   "image": "assets/team/Bhavya1 1.png",
    //   "des":
    //       "Bhavya Minocha, an Embedded Systems Engineer, specializes in high-speed PCB design and new product development across Automotive, IoT, and Consumer Electronics. With over 50 boards designed—including vehicle diagnostics and weather monitoring systems—Bhavya consistently delivers innovative hardware solutions marked by precision, reliability, and creative problem-solving. Outside of engineering, Bhavya is deeply committed to the discipline of music, having studied drumming for over 12 years—an interest that reinforces focus, rhythm, and structured thinking in professional pursuits."
   // },
    // {
    //   "name": "Dr. Ashwin Kamble",
    //   "designation": "Principal Biomedical Scientist",
    //   "linkedin": "https://www.linkedin.com/in/dr-ashwin-kamble-ph-d-096a7a1b/",
    //   "image": "assets/team/ASHWINedited 1.png",
    //   "des":
    //       "Dr. Ashwin Kamble, Senior Biomedical Engineer, holds a PhD in Signal Processing from VNIT, Nagpur, with a specialization in imagined speech recognition using EEG signals to enable patient-friendly communication. At a MedTech startup incubated at SINE, IIT Bombay, he played a key role in the development of advanced diagnostic devices in cardiovascular and nephrology care. His work spans brain-computer interfaces and cutting-edge biomedical signal processing, with multiple publications in reputed journals highlighting his contributions to the field."
    // }
  ];

  Widget _team(context, width) {
    return LayoutBuilder(builder: (_context, constraints) {
      return GetBuilder<HomeController>(builder: (_controller) {
        return VisibilityDetector(
          onVisibilityChanged: (VisibilityInfo info) {
            print(info);
            if (info.visibleFraction > 0.1) {
              print("visible");
              _controller.changeIsTeam(true); // o
            } //else {
            // _controller.changeIsTeam(false); // o
            //  }
          },
          key: Globals.teamSection,
          child: Container(
              constraints: BoxConstraints(maxWidth: width),
              color: AppTheme.black,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage(
              //           "assets/images/brain WB.gif",
              //         ),
              //         fit: BoxFit.contain)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      "Our team",
                      style: GoogleFonts.bebasNeue(
                          color: AppTheme.whiteColor,
                          fontSize: Constant.headingText(context),
                          letterSpacing: 5),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 70,
                    ),

                    // return _controller.teamList.isNotEmpty
                    //     ? _controller.teamList.first.data!.isNotEmpty
                    // (_controller.teamList.isNotEmpty)
                    //     ? (_controller.teamList.first.data!.isNotEmpty)
                    GridView.custom(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 60,
                        mainAxisExtent: ResponsiveLayout.isMediumScreen(context)
                            ? 480
                            : ResponsiveLayout.isSmallScreen(context)
                                ? 500
                                : 400,
                        mainAxisSpacing: 20,
                        crossAxisCount: ResponsiveLayout.isMediumScreen(context)
                            ? 2
                            : ResponsiveLayout.isSmallScreen(context)
                                ? 1
                                : 4,
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: teamList2.length,
                        // _controller.teamList.first.data!.length,
                        (context, index) {
                          double height =
                              ResponsiveLayout.isMediumScreen(context)
                                  ? 380
                                  : ResponsiveLayout.isSmallScreen(context)
                                      ? 380
                                      : 320;

                          // Generate a random delay between 100ms and 600ms
                          int randomDelay = Random().nextInt(500) + 300;
                          //  if(_controller.teamList.first.data![index].role!.contains("Advisor")){
                          //   return Container();

                          return GestureDetector(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _controller.hovering(index);
                                });
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MouseRegion(
                                  onEnter: (_) {
                                    if (kIsWeb) {
                                      setState(() {
                                        _controller.hovering(index);
                                      });
                                    }
                                  },
                                  onExit: (_) {
                                    if (kIsWeb) {
                                      setState(() {
                                        _controller.exithovering(index);
                                      });
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      // CachedNetworkImage(
                                      //   imageUrl: _controller
                                      //       .teamList
                                      //       .first
                                      //       .data![index]
                                      //       .profileUrl!,
                                      //   height: height,
                                      //   width: ResponsiveLayout
                                      //           .isMediumScreen(
                                      //               context)
                                      //       ? double.infinity
                                      //       : ResponsiveLayout
                                      //               .isSmallScreen(
                                      //                   context)
                                      //           ? double.infinity
                                      //           : 380,
                                      //   fit: BoxFit.cover,
                                      //   filterQuality:
                                      //       FilterQuality.high,
                                      //   alignment:
                                      //       Alignment.topCenter,
                                      //   progressIndicatorBuilder: (context,
                                      //           url,
                                      //           downloadProgress) =>
                                      //       CircularProgressIndicator(
                                      //           value:
                                      //               downloadProgress
                                      //                   .progress),
                                      //   errorWidget:
                                      //       (context, url, error) =>
                                      //           Icon(
                                      //     Icons.error,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                      Image.asset(
                                        alignment: Alignment.topCenter,
                                        "${teamList2[index]["image"]}",
                                        height: height,
                                        width: ResponsiveLayout.isMediumScreen(
                                                context)
                                            ? double.infinity
                                            : ResponsiveLayout.isSmallScreen(
                                                    context)
                                                ? double.infinity
                                                : 380,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                      AnimatedPositioned(
                                        bottom: _controller.hoverIndex == index
                                            ? 0
                                            : -height, // Slide effect
                                        left: 0,
                                        right: 0,
                                        duration: Duration(milliseconds: 400),
                                        child: Container(
                                          height: height,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(142, 0, 0, 0)),
                                          child: Theme(
                                            data: ThemeData(
                                                scrollbarTheme:
                                                    ScrollbarThemeData(
                                              thickness:
                                                  MaterialStateProperty.all(6),
                                              radius: Radius.circular(8),
                                              thumbColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          142, 7, 7, 7)),
                                              minThumbLength: 30,
                                            )),
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Text(
                                                  "${teamList2[index]["des"]}",
                                                  style: GoogleFonts.openSans(
                                                      color: Color.fromARGB(
                                                          216, 252, 248, 248),
                                                      fontSize: 12,
                                                      height: 2),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // Smooth fade-in effect
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "${teamList2[index]["name"]}",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.whiteColor,
                                      fontSize: Constant.body(context),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => launchurl(Uri.parse(
                                          "${teamList2[index]["linkedin"]}")),
                                      child: SvgPicture.asset(
                                        "assets/images/linkedin.svg",
                                        height: 16,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "  ${teamList2[index]["designation"]}",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              214, 233, 233, 233),
                                          fontSize:
                                              Constant.mediumbody(context),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    //     : CircularProgressIndicator()
                    // : Container(),
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      "advisor",
                      style: GoogleFonts.bebasNeue(
                          color: AppTheme.whiteColor,
                          fontSize: Constant.headingText(context),
                          letterSpacing: 5),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    GridView.custom(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 60,
                        mainAxisExtent: ResponsiveLayout.isMediumScreen(context)
                            ? 480
                            : ResponsiveLayout.isSmallScreen(context)
                                ? 500
                                : 400,
                        mainAxisSpacing: 20,
                        crossAxisCount: ResponsiveLayout.isMediumScreen(context)
                            ? 2
                            : ResponsiveLayout.isSmallScreen(context)
                                ? 1
                                : 4,
                      ),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: teamList.length,
                        (context, index) {
                          double height =
                              ResponsiveLayout.isMediumScreen(context)
                                  ? 380
                                  : ResponsiveLayout.isSmallScreen(context)
                                      ? 380
                                      : 320;

                          // Generate a random delay between 100ms and 600ms
                          int randomDelay = Random().nextInt(500) + 300;
                          //  if(_controller.teamList.first.data![index].role!.contains("Advisor")){
                          //   return Container();

                          return GestureDetector(
                            onTap: () {
                              if (kIsWeb) {
                                setState(() {
                                  _controller.hovering(index);
                                });
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MouseRegion(
                                  onEnter: (_) {
                                    if (kIsWeb) {
                                      setState(() {
                                        _controller.hovering(index);
                                      });
                                    }
                                  },
                                  onExit: (_) {
                                    if (kIsWeb) {
                                      setState(() {
                                        _controller.exithovering(index);
                                      });
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        alignment: Alignment.topCenter,
                                        "${teamList[index]["image"]}",
                                        height: height,
                                        width: ResponsiveLayout.isMediumScreen(
                                                context)
                                            ? double.infinity
                                            : ResponsiveLayout.isSmallScreen(
                                                    context)
                                                ? double.infinity
                                                : 380,
                                        fit: BoxFit.cover,
                                      ),
                                      AnimatedPositioned(
                                        bottom: _controller.hoverIndex == index
                                            ? 0
                                            : -height, // Slide effect
                                        left: 0,
                                        right: 0,
                                        duration: Duration(milliseconds: 400),
                                        child: Container(
                                          height: height,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(142, 0, 0, 0)),
                                          child: Theme(
                                            data: ThemeData(
                                                scrollbarTheme:
                                                    ScrollbarThemeData(
                                              thickness:
                                                  MaterialStateProperty.all(6),
                                              radius: Radius.circular(8),
                                              thumbColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          142, 7, 7, 7)),
                                              minThumbLength: 30,
                                            )),
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Text(
                                                  "${teamList[index]["des"]}",
                                                  style: GoogleFonts.openSans(
                                                      color: Color.fromARGB(
                                                          216, 252, 248, 248),
                                                      fontSize: 12,
                                                      height: 2),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // Smooth fade-in effect
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "${teamList[index]["name"]}",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.whiteColor,
                                      fontSize: Constant.body(context),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => launchurl(Uri.parse(
                                          "${_controller.teamList.first.data![index].linkedin}")),
                                      child: SvgPicture.asset(
                                        "assets/images/linkedin.svg",
                                        height: 16,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "  ${teamList[index]["designation"]}",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(
                                              214, 233, 233, 233),
                                          fontSize:
                                              Constant.mediumbody(context),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ])),
        );
      });
    });
  }
}
