import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      smallScreen: _team(context, MediaQuery.of(context).size.width * .9),
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
      "name": "Alois D Sajo",
      "designation": "Founder/CEO",
      "linkedin": "https://www.linkedin.com/in/aloissajodevasagayam/",
      "image": "assets/team/alois.webp",
      "des":
          "As the Founder & CEO of Archle Labs, I don’t just build products ,I create social impact. At the helm of a company redefining healthcare innovation, I bring a fusion of strategy,  product development, and user experience design to create solutions that drive meaningful innovation in the market. My journey spans leading social enterprises, crafting market -effective strategies, and assembling high-caliber teams that thrive on curiosity and first-principle thinking. When I’m not immersed in building the next advancement, you’ll find me exploring history,  diving into new cultures, exploring science, philosophy etc. I believe true innovation comes from questioning everything and daring to solve problems others shy away from."
    },
    {
      "name": "Dr.Siri Karthika R",
      "designation": "Health Director",
      "linkedin": "www.linkedin.com/in/siri-karthika",
      "image": "assets/team/siri.jpg",
      "des":
          "I blend medical expertise with bold innovation, ensuring research meets real-world patient needs. An MBBS graduate and University Rank holder in Pediatrics, I have an insatiable curiosity for epigenetics, neuroscience, and the quirks of human behavior. When I’m not deep in research, you’ll find me lifting weights, experimenting in the kitchen, or proving that a little eccentricity makes everything more interesting, even healthcare."
    },
    {
      "name": "Joel Prithvi Ignatius",
      "designation": "Data Scientist",
      "linkedin": "https://www.linkedin.com/in/joel-prithvi/",
      "image": "assets/team/joel.jpg",
      "des":
          "I’m a Data Scientist with 2.5 years of experience, specializing in transforming raw data into actionable insights, building machine learning models and automating processes to solve real-world challenges. I’m a Master's graduate in Big Data and Business Analytics, and have had experience helping a Fortune 500 company cut costs through analytics. Off-duty, I’m either shredding on my guitar (100+ shows), cooking up beats, shooting hoops, or deep diving into an anime binge."
    },
    {
      "name": "Tejas Prataprao Chavan",
      "designation": "R&D Mechatronics engineer",
      "linkedin": "https://www.linkedin.com/in/tejaspchavan",
      "image": "assets/team/tejas.jpg",
      "des":
          "I breathe life into machines, blending robotics, embedded systems, and AI-driven automation to create intelligent, high-performance solutions. From designing circuits to developing full-scale prototypes, I bridge the gap between mechanics and intelligence. With published research, design accolades, and innovations, I thrive on solving complex challenges—preferably with a strong coffee, a sketchbook in hand, and a deep dive into cinematography."
    },
    {
      "name": "Antara",
      "designation": "UX/UI Designer",
      "linkedin": "https://www.linkedin.com/in/antara-banik/",
      "image": "assets/team/antara.jpg",
      "des":
          "I design with empathy, curiosity, and just the right amount of obsession over the tiniest details. As a self-taught UX designer, I love decoding human behavior and transforming complex ideas into seamless, intuitive experiences. When I'm not crafting digital interfaces, you’ll find me lost in books about psychology, experimenting with colors, or perfecting my legendary rajma chawal recipe that is certified best by my family. I believe great design isn’t just about how things look, it’s about how they make people feel."
    },
    //  {
    //   "name": "Abnika Garg",
    //   "designation": "Flutter Developer",
    //   "linkedin": "https://www.linkedin.com/in/abnika-garg-135b0a165/",
    //   "image": "assets/team/abnika.jpeg",
    //   "des":
    //       "I build sleek, high-performing apps with Flutter while keeping the backend running smoothly ensuring great user experience. With four years of experience and a B.Tech in ECE, I specialize in crafting responsive UIs, real-time features, and powerful APIs. When I’m not coding, I’m exploring new tech, solving puzzles, or on a never-ending quest to build something truly surprising."
    // },
    {
      "name": "Dr.Suneera C M",
      "designation": "Principle NLP Scientist",
      "linkedin": "https://www.linkedin.com/in/suneera-c-moideen/",
      "image": "assets/team/suneera.jpg",
      "des":
          "As Principal NLP Scientist, I lead our AI team in crafting intelligent, user-friendly healthcare communication systems with a dash of linguistic wizardry. Armed with a PhD from NIT Calicut, six years of research, and honors like the ACM India Anveshan Setu Fellowship, I blend academic rigor with real-world innovation. When I’m not pioneering breakthrough projects, I embrace the delightful chaos of motherhood and a well-timed movie night ."
    },
    {
      "name": "Mohan Raja",
      "designation": "Application Developer",
      "linkedin": "https://www.linkedin.com/in/mogeoeg2224/",
      "image": "assets/team/mohan.jpg",
      "des":
          "I'm an Application Developer with 6.5 years of experience, turning complex backend challenges into seamless solutions. I've worked on projects like Marsh Insurance and FedEx, earned certifications in Microsoft AI, AWS, and CockroachDB, and even bagged the 2023 IAF Young Entrepreneur Award for CX. When I’m not coding, you’ll find me playing cricket, trekking, or whipping up a killer non-veg dish."
    }
  ];
  Widget _team(context, width) {
    return LayoutBuilder(builder: (_context, constraints) {
      return Container(
          constraints: BoxConstraints(maxWidth: width),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage(
          //           "assets/images/brain WB.gif",
          //         ),
          //         fit: BoxFit.contain)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "Meet our team",
              style: GoogleFonts.bebasNeue(
                  color: AppTheme.whiteColor,
                  fontSize: Constant.headingText(context),
                  letterSpacing: 5),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 70,
            ),
            GetBuilder<HomeController>(builder: (_controller) {
              // return _controller.teamList.isNotEmpty
              //     ? _controller.teamList.first.data!.isNotEmpty
              return GridView.custom(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 60,
                  //  tileBottomSpace: 20,
                  mainAxisExtent: ResponsiveLayout.isMediumScreen(context)
                      ? 280
                      : ResponsiveLayout.isSmallScreen(context)
                          ? 360
                          : 400,
                  mainAxisSpacing: 20,
                  crossAxisCount: ResponsiveLayout.isMediumScreen(context) ||
                          ResponsiveLayout.isSmallScreen(context)
                      ? 2
                      : 4,
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: teamList.length,
                  (context, index) {
                    double height = ResponsiveLayout.isMediumScreen(context)
                        ? 220
                        : ResponsiveLayout.isSmallScreen(context)
                            ? 280
                            : 320;
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _controller.hovering(index);
                                isHover = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _controller.exithovering(index);
                                isHover = false;
                              });
                            },
                            child: Stack(
                              children: [
                                Image.asset(
                                  alignment: Alignment.topCenter,
                                  "${teamList[index]["image"]}",
                                  height: height,
                                  width: ResponsiveLayout.isMediumScreen(
                                          context)
                                      ? 280
                                      : ResponsiveLayout.isSmallScreen(context)
                                          ? 250
                                          : 380,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                                AnimatedPositioned(
                                  bottom:
                                      isHover && index == _controller.hoverIndex
                                          ? 0
                                          : -height, // Slide from -300 to 0

                                  left: 0,
                                  right: 0,

                                  duration: Duration(milliseconds: 400),
                                  child: Container(
                                    height: height,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(142, 0, 0, 0)),
                                    child: RawScrollbar(
                                      trackColor: Colors.transparent,
                                      thumbColor: const Color.fromARGB(
                                          255, 147, 146, 145),
                                      radius: Radius.circular(12),
                                    
                                      thickness: 4,
                                    mainAxisMargin: 30.0,
                                      padding: EdgeInsets.only(right: 0, left:10),


                                      
                                      child: Theme(
                                        data: ThemeData(
                                            scrollbarTheme: ScrollbarThemeData(
                                          thumbColor: WidgetStatePropertyAll(Colors.transparent),
                                            trackColor: WidgetStatePropertyAll(Colors.transparent),
                                        )),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            "${teamList[index]["des"]}",
                                            style: GoogleFonts.openSans(
                                                color: const Color.fromARGB(
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
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${teamList[index]["name"]}",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.whiteColor,
                              fontSize: Constant.body(context),
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => launchurl(Uri.parse(
                                    "${teamList[index]["linkedin"]}")),
                                child: SvgPicture.asset(
                                  "assets/images/linkedin.svg",
                                  height: 16,
                                ),
                              ),
                              Text(
                                "  ${teamList[index]["designation"]}",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      const Color.fromARGB(214, 233, 233, 233),
                                  fontSize: Constant.mediumbody(context),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
              //     : CircularProgressIndicator()
              // : Container();
            }),
            SizedBox(
              height: 40,
            )
          ]));
    });
  }
}
