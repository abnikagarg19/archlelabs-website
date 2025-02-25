import 'package:archlelabswebsite/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../responsive/layouts.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';
import '../../utils/globals.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _Articles(context, 1200.0),
      // We will make this in a bit
      smallScreen: _Articles(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _Articles(context, 770.0),
    );
  }

  Widget _Articles(context, width) {
    return LayoutBuilder(builder: (context, constraints) {
      return GetBuilder<HomeController>(builder: (_controller) {
        return !_controller.isLoaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                key: Globals.container2Key,
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                ),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/art.gif",
                        ),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: width),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          "Articles",
                          style: GoogleFonts.bebasNeue(
                              color: AppTheme.black,
                              fontSize: Constant.headingText(context),
                              letterSpacing: 5),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (_controller.blogsListItems.isNotEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.blog, parameters: {
                                'id': _controller.blogsListItems[0].id.toString()
                              });
                            },
                            child: Flex(
                              direction: constraints.maxWidth > 800
                                  ? Axis.horizontal
                                  : Axis.vertical,
                              children: [
                                Expanded(
                                    flex: constraints.maxWidth > 800 ? 6 : 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/art1.png",
                                          height: 200,
                                          fit: BoxFit.cover,
                                          width: constraints.maxWidth > 800
                                              ? constraints.maxWidth > 1200
                                                  ? 500
                                                  : 300
                                              : 220,
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: constraints.maxWidth > 800 ? 6 : 0,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: constraints.maxWidth > 800
                                            ? 0
                                            : 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_controller.blogsListItems[0].title}",
                                          style: GoogleFonts.bebasNeue(
                                              color: AppTheme.black,
                                              fontSize: Constant.subheadingText(
                                                  context),
                                              letterSpacing: 5),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${_controller.blogsListItems[0].subTitle![0]}",
                                          style: GoogleFonts.openSans(
                                              color: AppTheme.black,
                                              fontSize: Constant.body(context),
                                              height: 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: 70,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        if (_controller.blogsListItems.isNotEmpty)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                _controller.blogsListItems
                                    .length, // Replace with the total number of items
                                (index) {
                                  if (index == 0) {
                                    return Container();
                                  }
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.blog, parameters: {
                                'id': _controller.blogsListItems[index].id.toString()
                              });
                                    },
                                    child: Container(
                                      width:
                                          300, // Ensure consistent width for each item
                                      margin: const EdgeInsets.only(
                                          right:
                                              100), // Add spacing between items
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            "assets/images/art1.png",
                                            height: 200,
                                            width: 300,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${_controller.blogsListItems[index].title}",
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w700,
                                              color: AppTheme.black,
                                              fontSize:
                                                  Constant.mediumbody(context),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${_controller.blogsListItems[index].subTitle![0]}",
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.black,
                                              fontSize:
                                                  Constant.smallbody(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              );
      });
    });
  }
}
