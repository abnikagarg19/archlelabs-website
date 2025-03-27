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
          "Distinguished Vascular Surgeon and Organ Transplant Administrator with 20 years of experience in vascular surgery and 15 years at the helm of the Tamil Nadu Government organ transplant program (2008–2016). Armed with credentials including MBBS, MS, DNB, and MCh in Vascular Surgery, he masterfully combines clinical expertise with innovation and a deep commitment to community service. Guided by the motto “Nothing is impossible,” Amal inspires his team to work hard and continuously learn—all while maintaining a refreshing sense of humor, as evidenced by his legendary hitchhike to the Indo-Pakistan border."
    }
  ];

    final teamList2 = [
    {
      "name": "Alois D Sajo",
      "designation": "Founder/CEO",
      "linkedin": "https://www.linkedin.com/in/aloissajodevasagayam/",
      "image": "assets/team/alois_edit.webp",
      "des":
          "As the Founder and CEO of Archle Labs, Alois Sajo is dedicated to creating meaningful social impact through innovative healthcare solutions. Leading a company at the forefront of redefining healthcare, he expertly integrates strategy, product development, and user experience design to deliver transformative market solutions. His journey includes leading successful social enterprises, developing effective market strategies, and building high-performing teams driven by curiosity and a commitment to first-principle thinking. When not focused on advancing the next breakthrough, he pursues interests in history, cultural exploration, and the fields of science and philosophy. Driven by a belief that true innovation stems from a willingness to challenge conventional thinking, he is deeply committed to making a lasting and positive impact."
    },
    {
      "name": "Dr.Siri Karthika R",
      "designation": "Health Director",
      "linkedin": "www.linkedin.com/in/siri-karthika",
      "image": "assets/team/siri_edit.jpg",
      "des":
          "She combines her medical expertise with a deep commitment to improving community health, ensuring that her research directly addresses the needs of underserved populations. An MBBS graduate and University Rank holder in Pediatrics, Dr.Siri Karthika is driven by a passion for advancing knowledge in epigenetics, neuroscience, and human behavior, with a particular focus on how these fields can improve public health outcomes. Outside of her research, she is dedicated to promoting wellness, whether through fitness, exploring nutrition, or engaging with local health initiatives."
    },
    {
      "name": "Joel Prithvi Ignatius",
      "designation": "Data Scientist",
      "linkedin": "https://www.linkedin.com/in/joel-prithvi/",
      "image": "assets/team/joel_edit.jpg",
      "des":
          "As a Data Scientist, he specializes in transforming raw data into actionable insights, building machine learning models, and automating processes to solve real-world challenges. Holding a Master's in Big Data and Business Analytics, Joel has contributed to helping a Fortune 500 company reduce costs. Outside of work, he engages in various activities such as playing guitar, having performed at over 100 shows, shooting hoops, or immersing himself in anime, as he values balance and draws inspiration from diverse interests."
    },
    {
      "name": "Tejas Prataprao Chavan",
      "designation": "R&D Mechatronics engineer",
      "linkedin": "https://www.linkedin.com/in/tejaspchavan",
      "image": "assets/team/tejas_edit.jpg",
      "des":
          "Tejas Chavan seamlessly integrates robotics, embedded systems, and AI-driven automation to create intelligent, high-performance solutions. From designing intricate circuits to developing full-scale prototypes, he consistently bridges the gap between mechanics and advanced technology. With a range of published research, design accolades, and innovative contributions, he approaches complex challenges with a diverse skill set"
    },
    {
      "name": "Antara",
      "designation": "UX/UI Designer",
      "linkedin": "https://www.linkedin.com/in/antara-banik/",
      "image": "assets/team/antara_edit.jpg",
      "des":
          "She approaches design with empathy, curiosity, and a meticulous attention to detail. Antara specializes in understanding human behavior and transforming complex concepts into seamless, intuitive experiences. Outside of her design work, she is deeply engaged in studying psychology and exploring color theory. She believes that great design goes beyond aesthetics; it’s about creating meaningful, impactful experiences that resonate with users."
    },
    {
      "name": "Abnika Garg",
      "designation": "Flutter Developer",
      "linkedin": "https://www.linkedin.com/in/abnika-garg-135b0a165/",
      "image": "assets/team/abnika_edit.jpeg",
      "des":
          "I build sleek, high-performing apps with Flutter while keeping the backend running smoothly ensuring great user experience. With four years of experience and a B.Tech in ECE, I specialize in crafting responsive UIs, real-time features, and powerful APIs. When I’m not coding, I’m exploring new tech, solving puzzles, or on a never-ending quest to build something truly surprising."
    },
    {
      "name": "Dr.Suneera C M",
      "designation": "Principle NLP Scientist",
      "linkedin": "https://www.linkedin.com/in/suneera-c-moideen/",
      "image": "assets/team/suneera_edit.jpg",
      "des":
          "Dr. Suneera, Principal NLP Scientist, leads the AI team in developing intelligent, user-centric healthcare communication systems. Her background includes a PhD from NIT Calicut, six years of research experience, and prestigious honors such as the ACM India Anveshan Setu Fellowship. She blends academic rigor with practical innovation to deliver impactful solutions in the field."
    },
    {
      "name": "Mohan Raja",
      "designation": "Application Developer",
      "linkedin": "https://www.linkedin.com/in/mogeoeg2224/",
      "image": "assets/team/mohan_edit.jpg",
      "des":
          "As an Application Developer, he specializes in transforming complex backend challenges into seamless solutions. Mohan Raj has contributed to projects for organizations such as Marsh Insurance and FedEx, earned certifications in Microsoft AI, AWS, and CockroachDB, and is a recipient of the 2023 IAF Young Entrepreneur Award for CX."
    },
     {
      "name": "Bhavya Minocha",
      "designation": "Embedded Systems Engineer",
      "linkedin": "https://www.linkedin.com/in/bhavya-minocha-17101022a/",
      "image": "assets/team/Bhavya1 1.png",
      "des":
          "Bhavya Minocha is an Embedded Systems Engineer with 2+ years of experience in High-Speed PCB design and New Product Development, spanning Automotive, IoT, and Consumer Electronics. Designed 50+ boards, including vehicle diagnostics and weather monitoring systems, Bhavya thrives on solving complex hardware challenges with precision and creativity. When not engineering, they’re either drumming up beats (12+ years strong) or cooking a killer biryani."
    },
    {
      "name": "Dr. Ashwin Kamble",
      "designation": "Principal Biomedical Scientist",
      "linkedin": "https://www.linkedin.com/in/dr-ashwin-kamble-ph-d-096a7a1b/",
      "image": "assets/team/ASHWINedited 1.png",
      "des":
          "Dr. Ashwin Kamble is a Senior Biomedical Engineer with extensive MedTech R&D experience. He holds a PhD in Signal Processing from VNIT, Nagpur, specializing in imagined speech recognition from EEG signals for patient-friendly communication. At a MedTech startup incubated at SINE, IIT Bombay, he contributed to developing advanced cardiovascular and nephrology diagnostic devices. His expertise includes brain-computer interfaces and he has published several research papers in reputed journals."
    }
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
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 60,
                                  mainAxisExtent: ResponsiveLayout
                                          .isMediumScreen(context)
                                      ? 480
                                      : ResponsiveLayout.isSmallScreen(context)
                                          ? 500
                                          : 400,
                                  mainAxisSpacing: 20,
                                  crossAxisCount: ResponsiveLayout
                                          .isMediumScreen(context)
                                      ? 2
                                      : ResponsiveLayout.isSmallScreen(context)
                                          ? 1
                                          : 4,
                                ),
                                childrenDelegate: SliverChildBuilderDelegate(
                                  childCount:
                                        teamList2.length,
                                      // _controller.teamList.first.data!.length,
                                  (context, index) {
                                    double height =
                                        ResponsiveLayout.isMediumScreen(context)
                                            ? 380
                                            : ResponsiveLayout.isSmallScreen(
                                                    context)
                                                ? 380
                                                : 320;

                                    // Generate a random delay between 100ms and 600ms
                                    int randomDelay =
                                        Random().nextInt(500) + 300;
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                  _controller
                                                      .exithovering(index);
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
                                                  width: ResponsiveLayout
                                                          .isMediumScreen(
                                                              context)
                                                      ? double.infinity
                                                      : ResponsiveLayout
                                                              .isSmallScreen(
                                                                  context)
                                                          ? double.infinity
                                                          : 380,
                                                  fit: BoxFit.cover,
                                                  filterQuality: FilterQuality.high,
                                                ),
                                                AnimatedPositioned(
                                                  bottom: _controller
                                                              .hoverIndex ==
                                                          index
                                                      ? 0
                                                      : -height, // Slide effect
                                                  left: 0,
                                                  right: 0,
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                  child: Container(
                                                    height: height,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 6,
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                            142, 0, 0, 0)),
                                                    child: Theme(
                                                      data: ThemeData(
                                                          scrollbarTheme:
                                                              ScrollbarThemeData(
                                                        thickness:
                                                            MaterialStateProperty
                                                                .all(6),
                                                        radius:
                                                            Radius.circular(8),
                                                        thumbColor:
                                                            MaterialStateProperty
                                                                .all(Color
                                                                    .fromARGB(
                                                                        142,
                                                                        7,
                                                                        7,
                                                                        7)),
                                                        minThumbLength: 30,
                                                      )),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16),
                                                          child: Text(
                                                            "${teamList2[index]["des"]}",
                                                            style: GoogleFonts
                                                                .openSans(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            216,
                                                                            252,
                                                                            248,
                                                                            248),
                                                                    fontSize:
                                                                        12,
                                                                    height: 2),
                                                            textAlign: TextAlign
                                                                .justify,
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
                                                fontSize:
                                                    Constant.body(context),
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
                                                        Constant.mediumbody(
                                                            context),
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                  width: ResponsiveLayout
                                                          .isMediumScreen(
                                                              context)
                                                      ? double.infinity
                                                      : ResponsiveLayout
                                                              .isSmallScreen(
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
