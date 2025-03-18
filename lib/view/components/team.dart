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
                    (_controller.teamList.isNotEmpty)
                        ? (_controller.teamList.first.data!.isNotEmpty)
                            ? GridView.custom(
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
                                      _controller.teamList.first.data!.length,
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
                                                CachedNetworkImage(
                                                  imageUrl: _controller
                                                      .teamList
                                                      .first
                                                      .data![index]
                                                      .profileUrl!,
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
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(
                                                    Icons.error,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                // Image.asset(
                                                //   alignment: Alignment.topCenter,
                                                //   "${teamList[index]["image"]}",
                                                //   height: height,
                                                //   width: ResponsiveLayout.isMediumScreen(
                                                //           context)
                                                //       ? 280
                                                //       : ResponsiveLayout.isSmallScreen(
                                                //               context)
                                                //           ? MediaQuery.of(context)
                                                //                   .size
                                                //                   .width *
                                                //               0.35
                                                //           : 380,
                                                //   fit: BoxFit.cover,
                                                //   filterQuality: FilterQuality.high,
                                                // ),
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
                                                            "${_controller.teamList.first.data![index].description!}",
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
                                              "${_controller.teamList.first.data![index].name!}",
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
                                                    "${_controller.teamList.first.data![index].linkedin}")),
                                                child: SvgPicture.asset(
                                                  "assets/images/linkedin.svg",
                                                  height: 16,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "  ${_controller.teamList.first.data![index].role!}",
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
                              )
                            : CircularProgressIndicator()
                        : Container(),
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
