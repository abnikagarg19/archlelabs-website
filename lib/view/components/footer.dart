import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../responsive/layouts.dart';
import '../../theme/app_theme.dart';
import '../../utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _footer(context, 1200.0),
      // We will make this in a bit
      smallScreen: _footer(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _footer(context, 770.0),
    );
  }

  void _launchMailClient(String targetEmail) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'example@example.com',
      queryParameters: {
        'subject': 'Hello from Flutter Web',
        'body': 'This is a test email.'
      },
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch email client');
    }
  }

  launchurl(emailLaunchUri) async {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Could not launch email client');
    }
  }

  Widget _footer(context, width) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/contact us.png",
                  ),
                  fit: BoxFit.fill)),
          child: Center(
            child: Container(   
              constraints: BoxConstraints(maxWidth: width),
              child: Column(
                children: [
                  Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    direction: constraints.maxWidth > 800
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      Expanded(
                        flex: constraints.maxWidth > 800.0 ? 1 : 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                "Collaboration Starts here",
                                style: GoogleFonts.openSans(
                                  color: AppTheme.whiteColor,
                                  fontSize: Constant.textFourtyEight(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Innovators, interns, or investors—let’s create together",
                                style: GoogleFonts.openSans(
                                  color: AppTheme.whiteColor,
                                  fontSize: Constant.smallbheadingText(context),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),  
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                      Expanded(
                          flex: constraints.maxWidth > 800 ? 1 : 0,
                          child: Row(
                            mainAxisAlignment: constraints.maxWidth > 800
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(crossAxisAlignment:constraints.maxWidth > 800? CrossAxisAlignment.end:CrossAxisAlignment.start,
                              
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Image.asset(
                                      "assets/images/logo.png",
                                      height:
                                          constraints.maxWidth > 800 ? 150 : 70,
                                      fit: BoxFit.cover,
                                      width:
                                          constraints.maxWidth > 800 ? null : 150,
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    direction: constraints.maxWidth > 800
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      Expanded(
                        flex: constraints.maxWidth > 800.0 ? 1 : 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                            
                              InkWell(
                                onTap: () {
                                  _launchMailClient("alois@archlelabs.com");
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/email.svg",
                                      height: 20,
                                    ),
                                    Text(
                                      "  alois@archlelabs.com",
                                      style: GoogleFonts.openSans(
                                        color: AppTheme.whiteColor,
                                        fontSize: Constant.mediumbody(context),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/mingcute_phone-fill.svg",
                                    height: 20,
                                  ),
                                  Text(
                                    "  +91 9444725511",
                                    style: GoogleFonts.openSans(
                                      color: AppTheme.whiteColor,
                                      fontSize: Constant.body(context),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                "Connect on socials",
                                style: GoogleFonts.openSans(
                                  color: AppTheme.whiteColor,
                                  fontSize: Constant.textFourty(context),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/Vector.svg",
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchurl(Uri.parse(
                                          "https://www.linkedin.com/company/archlelabs/posts/?feedView=all"));
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/linkedin.svg",
                                      height: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchurl(Uri.parse(
                                          "https://www.instagram.com/archlelabs?igsh=MW5kM3JsM2NvZ21zdQ%3D%3D"));
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/insta.svg",
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                      Expanded(
                          flex: constraints.maxWidth > 800 ? 1 : 0,
                          child: Row(
                            mainAxisAlignment: constraints.maxWidth > 800
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(crossAxisAlignment:constraints.maxWidth > 800? CrossAxisAlignment.end:CrossAxisAlignment.start,
                              
                                  children: [
                                   
                                       SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/images/skill4.png",
                                                                             height:
                                                constraints.maxWidth > 800 ? 120 : 70,
                                          fit: BoxFit.cover,
                                          //  width: constraints.maxWidth > 800 ? null : 150,
                                        ),
                                          Image.asset(
                                      "assets/images/skill2.png",
                                       height:
                                            constraints.maxWidth > 800 ? 120 : 70,
                                      fit: BoxFit.cover,
                                      //  width: constraints.maxWidth > 800 ? null : 150,
                                    ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      "assets/images/skill3.png",
                                      height:
                                            constraints.maxWidth > 800 ? 100 : 60,
                                      fit: BoxFit.cover,
                                      //  width: constraints.maxWidth > 800 ? null : 150,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}   
