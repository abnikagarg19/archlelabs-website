import 'package:archlelabswebsite/controller/blogController.dart';
import 'package:archlelabswebsite/models/BlogModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../responsive/layouts.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'components/navbar.dart';

class BlogDetails extends StatelessWidget {
  BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            ResponsiveLayout(
              largeScreen: buildBodyBlog(context, 1200.0),
              // We will make this in a bit
              smallScreen: buildBodyBlog(
                  context, MediaQuery.of(context).size.width * .9),
              mediumScreen: buildBodyBlog(context, 770.0),
            )
          ],
        ),
      ),
    );
  }

  buildBodyBlog(context, width) {
  
    return LayoutBuilder(builder: (context, constraints) {
      return GetBuilder<BlogController>(builder: (_controller) {
        return !_controller.isLoaded
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
            constraints: BoxConstraints(maxWidth: width),
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topLeft,
                  children: [
                    if (constraints.maxWidth > 800)
                      Row(
                        children: [
                          Image.network(
                            "${_controller.blogsListItems.images![0]}", 
                            height: 400,
                            fit: BoxFit.cover,
                            width: constraints.maxWidth > 800
                                ? constraints.maxWidth > 1200
                                    ? 500
                                    : 300
                                : 100,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                           "${_controller.blogsListItems.body1}",    style: GoogleFonts.openSans(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  fontSize: Constant.body(context),
                                  height: 2),
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                         Image.network(
                            "${_controller.blogsListItems.images![0]}", 
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                           "${_controller.blogsListItems.body1}",    style: GoogleFonts.openSans(
                                color: Color.fromRGBO(166, 166, 166, 1),
                                fontSize: Constant.body(context),
                                height: 2),
                          ),
                        ],
                      ),
                    Positioned(
                      top: -100,
                      left: 40,
                      right: 0,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "${_controller.blogsListItems.title}",
                              style: GoogleFonts.openSans(
                                  color: AppTheme.whiteColor,
                                  height: 1.5,
                                  fontWeight: FontWeight.w200,
                                  fontSize: Constant.mainHeading(context),
                                  letterSpacing: 1),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Flex(
                  direction:
                      constraints.maxWidth > 800 ? Axis.horizontal : Axis.vertical,
                  children: [
                    // Expanded(
                    //     flex: constraints.maxWidth > 800 ? 6 : 0,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Flexible(
                    //           child: Text(
                    //             "Unlocking the future",
                    //             style: GoogleFonts.openSans(
                    //                 color: AppTheme.whiteColor,
                    //                 height: 1.5,
                    //                 fontWeight: FontWeight.w200,
                    //                 fontSize: Constant.mainHeading(context),
                    //                 letterSpacing: 1),
                    //             textAlign: TextAlign.start,
                    //           ),
                    //         ),
                    //       ],
                    //     )),
                    Expanded(
                      flex: constraints.maxWidth > 800 ? 6 : 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: constraints.maxWidth > 800 ? 0 : 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_controller.blogsListItems.body2}",
                              style: GoogleFonts.openSans(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  fontSize: Constant.body(context),
                                  height: 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Flex(
                  direction:
                      constraints.maxWidth > 800 ? Axis.horizontal : Axis.vertical,
                  children: [
                    Expanded(
                      flex: constraints.maxWidth > 800 ? 6 : 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: constraints.maxWidth > 800 ? 0 : 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             "${_controller.blogsListItems.body3}",
                              style: GoogleFonts.openSans(
                                  color: Color.fromRGBO(166, 166, 166, 1),
                                  fontSize: Constant.body(context),
                                  height: 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: constraints.maxWidth > 800 ? 6 : 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          Image.network(
                            "${_controller.blogsListItems.images![2]}", 
                              height: 400,
                              fit: BoxFit.cover,
                              width: constraints.maxWidth > 800
                                  ? constraints.maxWidth > 1200
                                      ? 500
                                      : 300
                                  : MediaQuery.of(context).size.width * 0.9,
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          );
        }
      );
    });
  }
}
