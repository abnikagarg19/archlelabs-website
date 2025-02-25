import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
      largeScreen: _team(context,1200),
      // We will make this in a bit
      smallScreen: _team(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _team(context, 770.0),
    );
  }

  Widget _team(context, width) {
    return LayoutBuilder(builder: (_context, constraints) {
      return Container(
          constraints: BoxConstraints(maxWidth: width),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/team.png",
                  ),
                  fit: BoxFit.cover)),
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
              return  _controller.teamList.isNotEmpty?  _controller.teamList.first.data!.isNotEmpty? GridView.custom(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 30,
                  //  tileBottomSpace: 20,
                  mainAxisExtent: ResponsiveLayout.isMediumScreen(context)
                      ? 280
                      : ResponsiveLayout.isSmallScreen(context)
                          ? 250
                          : 380,
                  mainAxisSpacing: 20,
                  crossAxisCount: ResponsiveLayout.isMediumScreen(context) ||
                          ResponsiveLayout.isSmallScreen(context)
                      ? 3
                      : 4,
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: _controller.teamList.first.data!.length,
                  (context, index) {
                    double height = ResponsiveLayout.isMediumScreen(context)
                        ? 220
                        : ResponsiveLayout.isSmallScreen(context)
                            ? 200
                            : 300;
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
                                Image.network(
                                  alignment: Alignment.topCenter,
                                  "${_controller.teamList.first.data![index].profileUrl}",
                                  height: height,
                                  width: ResponsiveLayout.isMediumScreen(
                                          context)
                                      ? 280
                                      : ResponsiveLayout.isSmallScreen(context)
                                          ? 250
                                          : 380,
                                  fit: BoxFit.cover,
                                ),
                                AnimatedPositioned(
                                  bottom: isHover && index == _controller.hoverIndex
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
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "  ${_controller.teamList.first.data![index].description}",
                                        style: GoogleFonts.openSans(
                                            color: const Color.fromARGB(
                                                216, 252, 248, 248),
                                            fontSize: 12,
                                            height: 2),
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
                           "${_controller.teamList.first.data![index].name}",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(214, 233, 233, 233),
                              fontSize: Constant.smallbody(context),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              InkWell(
                               // onTap: () => launchUrl,
                                child: SvgPicture.asset(
                                  "assets/images/linkedin.svg",
                                  height: 16,
                                ),
                              ),
                              Text(
                                "  ${_controller.teamList.first.data![index].role}",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      const Color.fromARGB(214, 233, 233, 233),
                                  fontSize: Constant.smallbody(context),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ): CircularProgressIndicator():Container();
            }),
            SizedBox(
              height: 40,
            )
          ]));
    });
  }
}
