import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:archlelabswebsite/utils/dailog.dart';
import 'package:archlelabswebsite/utils/globals.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/homeController.dart';
import '../../responsive/layouts.dart';
import '../../theme/app_theme.dart';
import '../../utils/border_textbox.dart';
import '../../utils/constants.dart';
import '../../utils/multiline_textbox.dart';
import '../../utils/text_feilds.dart';

class ContactUs extends StatefulWidget {
  ContactUs({
    super.key,
  });

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Start from the right
      end: Offset(0.0, 0.0), // Move to its position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward(from: 0.0); // Restart animation
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: _widget(context, 1200.0),
      // We will make this in a bit
      smallScreen: _widget(context, MediaQuery.of(context).size.width * .9),
      mediumScreen: _widget(context, 770.0),
    );
  }

  final queryFormKey = GlobalKey<FormState>();
  final hireFormKey = GlobalKey<FormState>();
  final pressFormKey = GlobalKey<FormState>();
  final inestFormQuery = GlobalKey<FormState>();

  int selectIndex = 0;
  int hoverIndex = -1;
  final formTypes = [
    {
      "title": "Queries",
      "des":
          "Collaborate with Archle Labs to pioneer cutting-edge advancements in health and life sciences. Together, we can redefine the future of healthcare through innovation, research, and transformative solutions."
    },
    {
      "title": "Investors",
      "des":
          "Partner with Archle Labs to redefine patient care through cutting-edge innovation. Invest in transformative innovations that redefine healthcare and create lasting global impact."
    },
    {
      "title": "Press release",
      "des":
          "Collaborate with Archle Labs to pioneer cutting-edge advancements in health and life sciences. Together, we can redefine the future of healthcare through innovation, research, and transformative solutions."
    },
    {
      "title": "Hire",
      "des":
          "Advance your career with Archle Labs and be at the forefront of innovation in health and life sciences. Join a team of visionary researchers,doctors  and engineers shaping the future of healthcare through groundbreaking discoveries."
    },
  ];

  Widget _widget(
    context,
    width,
  ) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          key: Globals.container3Key,
          width: constraints.maxWidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/contact.png",
                  ),
                  opacity: 1,
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              constraints: BoxConstraints(maxWidth: width, minWidth: width),
              child: constraints.maxWidth > 800
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 6,
                            child: buildLargeLeftSide(constraints, context)),
                        SizedBox(
                          width: 100,
                        ),
                        Expanded(
                            flex: 6,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 400),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return SlideTransition(
                                  position: _slideAnimation,
                                  child: child,
                                );
                              },
                              child: buildSwitchForms(context),
                            ))
                      ],
                    )
                  : Column(
                      children: [buildSmallCat(constraints, context)],
                    ),
            ),
          ));
    });
  }

  buildSwitchForms(context) {
    switch (selectIndex) {
      case 0:
        return buildQueryForm(context);
      case 1:
        return buildInvestorForm(context);
      case 2:
        return buildPressRelease(context);
      default:
        return buildHireForm(context);
    }
  }

  Widget buildPressRelease(context) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return Form(
        key: pressFormKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30,
          ),
          decoration: BoxDecoration(color: AppTheme.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${formTypes[selectIndex]["title"]}",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbheadingText(context),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.namePress,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9]")),
                        ],
                        textEditingController: _controller.phonePress,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone No is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Phone No",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.emailPress,
                        validation: (value) {
                          RegExp emailValidatorRegExp = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!emailValidatorRegExp
                              .hasMatch(value.trim())) {
                            return 'Enter Valid email';
                          }
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Email Id",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Subject     ",
                          style: GoogleFonts.openSans(
                            color: AppTheme.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Constant.smallbody(context),
                          ),
                        ),
                        Expanded(
                          child: BorderedTextbox(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.subjectPress,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Subject is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Subject",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        textEditingController: _controller.quesPress,

                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Your Question",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    InputTextFieldMaxlines(
                      textEditingController: _controller.titlePress,
                      hintText: "Write Your Title",
                      counterText: "100",
                      maxLines: 2,
                      maxlength: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Upload Relevant files",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbody(context),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildFilePicker(
                          context,
                          () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              Uint8List? fileBytes = result.files.first.bytes;
                              String fileName = result.files.first.name;
                              _controller.selectFileePressRelase(
                                  fileBytes, fileName);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                        Flexible(
                          child: Text(
                            "  ${_controller.fileePressRelasename}",
                            style: GoogleFonts.openSans(
                              color: AppTheme.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Constant.smallbody(context),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (pressFormKey.currentState!.validate()) {
                    _controller.createPressRelase();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(color: AppTheme.black),
                  child: Center(
                    child: Text(
                      "Send",
                      style: GoogleFonts.openSans(
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.body(context),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    });
  }

  // final List<String> designation = [
  //   'Bio Medical Engineer',
  //   'Medical Adviser',
  //   'Product Manager',
  // ];

  final List<String> investor = [
    'Abc company',
    'Individual',
  ];
  String? selectedDesignation;
  var designationData;
  String? selectedInvestor;
  Widget buildQueryForm(context) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return Form(
        key: queryFormKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 30,
          ),
          decoration: BoxDecoration(color: AppTheme.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${formTypes[selectIndex]["title"]}",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbheadingText(context),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.firstnameQuery,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "First Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "First Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.lastnameQuery,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Last Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Last Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z0-9]")),
                        ],
                        textEditingController: _controller.phoneQuery,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone No is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Phone No",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.emailQuery,
                        validation: (value) {
                          RegExp emailValidatorRegExp = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!emailValidatorRegExp
                              .hasMatch(value.trim())) {
                            return 'Enter Valid email';
                          }
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Email Id",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Subject     ",
                          style: GoogleFonts.openSans(
                            color: AppTheme.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Constant.smallbody(context),
                          ),
                        ),
                        Expanded(
                          child: BorderedTextbox(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.subjectQuery,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Subject is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "Subject",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InputTextFieldMaxlines(
                      textEditingController: _controller.queryQuery,
                      hintText: "Write Your Query",
                      counterText: "100",
                      maxLines: 2,
                      maxlength: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Upload Relevant files",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbody(context),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildFilePicker(
                          context,
                          () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              Uint8List? fileBytes = result.files.first.bytes;
                              String fileName = result.files.first.name;
                              _controller.selectFile(fileBytes, fileName);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                        Flexible(
                          child: Text(
                            "  ${_controller.filequeryname}",
                            style: GoogleFonts.openSans(
                              color: AppTheme.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Constant.smallbody(context),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (queryFormKey.currentState!.validate()) {
                    _controller.createQueryForm();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(color: AppTheme.black),
                  child: Center(
                    child: Text(
                      "Send",
                      style: GoogleFonts.openSans(
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.body(context),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildInvestorForm(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: AppTheme.whiteColor),
      child: GetBuilder<HomeController>(builder: (_controller) {
        return Form(
          key: inestFormQuery,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${formTypes[selectIndex]["title"]}",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbheadingText(context),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // DropdownButtonHideUnderline(
                    //   child: DropdownButton2<String>(
                    //     isExpanded: true,
                    //     hint: Text(
                    //       'Select Company',
                    //       style: GoogleFonts.openSans(
                    //           color: AppTheme.textBlackColor, fontSize: 13),
                    //     ),
                    //     items: investor
                    //         .map((String item) => DropdownMenuItem<String>(
                    //               value: item,
                    //               child: Text(
                    //                 item,
                    //                 style: const TextStyle(
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ))
                    //         .toList(),
                    //     value: selectedInvestor,
                    //     onChanged: (String? value) {
                    //       setState(() {
                    //         selectedInvestor = value;
                    //       });
                    //     },
                    //     buttonStyleData: ButtonStyleData(
                    //       height: 30,
                    //       width: 200,
                    //       padding: const EdgeInsets.only(left: 8, right: 8),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(2),
                    //         border: Border.all(
                    //           color: Colors.black,
                    //         ),
                    //         color: Colors.white,
                    //       ),
                    //       elevation: 0,
                    //     ),
                    //     isDense: true,
                    //     menuItemStyleData: const MenuItemStyleData(
                    //       height: 30,
                    //     ),
                    //   ),
                    // ),

                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.companyname,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Company Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Company Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.firstNameInvestor,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "First Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "First Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.lastnameInvestor,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Last Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Last Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.phoneInvestor,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone No is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Phone No",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.emailInvestor,
                        validation: (value) {
                          RegExp emailValidatorRegExp = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!emailValidatorRegExp
                              .hasMatch(value.trim())) {
                            return 'Enter Valid email';
                          }
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Email Id",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Type of Investor    ",
                          style: GoogleFonts.openSans(
                            color: AppTheme.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Constant.smallbody(context),
                          ),
                        ),
                        Expanded(
                          child: BorderedTextbox(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.subjectPress,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Type of Investor is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "",
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Upload Relevant files",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbody(context),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildFilePicker(
                          context,
                          () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              Uint8List? fileBytes = result.files.first.bytes;
                              String fileName = result.files.first.name;
                              _controller.selectFileInvestors(
                                  fileBytes, fileName);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                        Flexible(
                          child: Text(
                            "  ${_controller.fileInvestorname}",
                            style: GoogleFonts.openSans(
                              color: AppTheme.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Constant.smallbody(context),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (inestFormQuery.currentState!.validate()) {
                    _controller.createInvestors();
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 100),
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(color: AppTheme.black),
                  child: Center(
                    child: Text(
                      "Send",
                      style: GoogleFonts.openSans(
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.body(context),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildHireForm(context) {
    return GetBuilder<HomeController>(builder: (_controller) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(color: AppTheme.whiteColor),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Form(
                key: hireFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Designation",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbheadingText(context),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    if (_controller.designationList.isNotEmpty)
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select Designation',
                                  style: GoogleFonts.openSans(
                                      color: AppTheme.textBlackColor,
                                      fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                ),
                                
                                items: _controller.designationList
                                    .map<DropdownMenuItem<String>>((data) {
                                  return DropdownMenuItem<String>(
                                    value: data["id"].toString(),
                                    child: Text(data["job_title"].toString(),   overflow: TextOverflow.ellipsis,
                                      maxLines: 1,),
                                  );
                                }).toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Designation is required';
                                  }
                                  return null;
                                },
                            
                                value: selectedDesignation,
                                onChanged: (String? value) {
                                  setState(() {
                                    print(value);

                                    int index =
                                        _controller.designationList.indexWhere(
                                      (element) =>
                                          element['id'].toString() ==
                                          value.toString(),
                                    );

                                    designationData =
                                        _controller.designationList[index];
                                    selectedDesignation = _controller
                                        .designationList[index]["id"]
                                        .toString();
                                  });
                                },
                                decoration: InputDecoration(border: InputBorder.none, errorStyle: GoogleFonts.inter(fontSize: 12),),
                                buttonStyleData: ButtonStyleData(
                                  
                                  height: 30,
                                  width: 200,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    color: Colors.white,
                                  ),
                                  elevation: 0,
                                ),
                                isDense: true,
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 30,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: (selectedDesignation != null)
                                ? GestureDetector(
                                    onTap: () {
                                      showCustomDialog();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 6),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppTheme.textBlackColor)),
                                      child: Text(
                                        "View Job Description",
                                        style: GoogleFonts.openSans(
                                            color: AppTheme.textBlackColor,
                                            fontSize: 12),
                                      ),
                                    ))
                                : Container(),
                          )
                        ],
                      ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.firstNameJob,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "First Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "First Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.lastNameJob,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Last Name is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Last Name",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.phoneJob,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone No is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Phone No",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.emailJob,
                        validation: (value) {
                          RegExp emailValidatorRegExp = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!emailValidatorRegExp
                              .hasMatch(value.trim())) {
                            return 'Enter Valid email';
                          }
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Email Id",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          "Linked In   ",
                          style: GoogleFonts.openSans(
                            color: AppTheme.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Constant.smallbody(context),
                          ),
                        ),
                        Expanded(
                          child: BorderedTextbox(
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(
                            //       RegExp("[a-zA-Z0-9]")),
                            // ],
                            textEditingController: _controller.linkedin,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Linkedin is required";
                              }
                              return null;
                            },
                            // icon: const Icon(Icons.check_circle_outline,
                            //     color: Colors.blue),
                            hintText: "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextField(
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //       RegExp("[a-zA-Z0-9]")),
                        // ],
                        textEditingController: _controller.exp,
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return "Experience is required";
                          }
                          return null;
                        },
                        // icon: const Icon(Icons.check_circle_outline,
                        //     color: Colors.blue),
                        hintText: "Experience",
                        color: const Color(0xff585A60)),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Upload Your Resume",
                      style: GoogleFonts.openSans(
                        color: AppTheme.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Constant.smallbody(context),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        buildFilePicker(
                          context,
                          () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              Uint8List? fileBytes = result.files.first.bytes;
                              String fileName = result.files.first.name;
                              _controller.selectFileeJob(fileBytes, fileName);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                        Flexible(
                          child: Text(
                            "  ${_controller.filejobName}",
                            style: GoogleFonts.openSans(
                              color: AppTheme.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Constant.smallbody(context),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (hireFormKey.currentState!.validate()) {
                  if(_controller.fileeJob==null){
                    DialogHelper.showErroDialog(description: "Select Resume");
                    return;
                  }
                  _controller.createJob();
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 100),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(color: AppTheme.black),
                child: Center(
                  child: Text(
                    "Send",
                    style: GoogleFonts.openSans(
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Constant.body(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void showCustomDialog() {
    Get.dialog(
      Dialog(
          backgroundColor: AppTheme.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2), // Border radius
          ),
          child: FunkyOverlay(designationList: designationData)),
    );
  }

  void onTabPress(int index) {
    // if (index != selectIndex) {
    setState(() {
      selectIndex = index;
      _controller.forward(from: 0.0); // Restart animation
    });
    //}
  }

  Widget buildLargeLeftSide(constraints, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        for (int i = 0; i < formTypes.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              children: [
                Expanded(
                    child: Material(
                  color: Colors.transparent, // Keeps background transparent
                  child: InkWell(
                    onTap: () {
                      onTabPress(i);
                    },
                    onHover: (isHovering) {
                      if (isHovering) {
                        setState(() {
                          hoverIndex = i; // Add a hover index variable
                        });
                      } else {
                        setState(() {
                          hoverIndex = -1;
                        });
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        color: i == selectIndex
                            ? AppTheme.whiteColor
                            : (i == hoverIndex
                                ? Colors.grey[700]
                                : AppTheme.black),
                      ),
                      child: Center(
                        child: Text(
                          "${formTypes[i]["title"]}",
                          style: GoogleFonts.openSans(
                            color: i == selectIndex
                                ? AppTheme.black
                                : AppTheme.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Constant.smallbheadingText(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                if (i + 1 < formTypes.length) ...[
                  SizedBox(width: 8), // Space between two containers
                  Expanded(
                      child: Material(
                    color: Colors.transparent, // Keeps background transparent
                    child: InkWell(
                      onTap: () {
                        onTabPress(i + 1);
                      },
                      onHover: (isHovering) {
                        if (isHovering) {
                          setState(() {
                            hoverIndex = i + 1; // Add a hover index variable
                          });
                        } else {
                          setState(() {
                            hoverIndex = -1;
                          });
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: i + 1 == selectIndex
                              ? AppTheme.whiteColor
                              : (i + 1 == hoverIndex
                                  ? Colors.grey[700]
                                  : AppTheme.black),
                        ),
                        child: Center(
                          child: Text(
                            "${formTypes[i + 1]["title"]}",
                            style: GoogleFonts.openSans(
                              color: i + 1 == selectIndex
                                  ? AppTheme.black
                                  : AppTheme.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Constant.smallbheadingText(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
                ],
              ],
            ),
          ),
        SizedBox(
          height: 100,
        ),
        Text(
          "Contact Us",
          style: GoogleFonts.bebasNeue(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 6,
            fontSize: Constant.headingText(context),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "${formTypes[selectIndex]["des"]}",
          style: GoogleFonts.openSans(
            color: AppTheme.whiteColor,
            fontSize: Constant.body(context),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget buildSmallCat(constraints, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Contact Us",
          style: GoogleFonts.bebasNeue(
            color: AppTheme.whiteColor,
            letterSpacing: 6,
            fontWeight: FontWeight.w600,
            fontSize: Constant.headingText(context),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < formTypes.length; i += 1)
                InkWell(
                  onTap: () {
                    onTabPress(i);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(left: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: i == selectIndex
                          ? AppTheme.whiteColor
                          : (i == hoverIndex
                              ? Colors.grey[700]
                              : AppTheme.black), // Change color on hover,
                    ),
                    child: Center(
                      child: Text(
                        "${formTypes[i]["title"]}",
                        style: GoogleFonts.openSans(
                          color: i == selectIndex
                              ? AppTheme.black
                              : AppTheme.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: Constant.smallbody(context),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildSwitchForms(context),
      ],
    );
  }
}

buildFilePicker(context, ontap) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppTheme.black,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.upload,
              color: AppTheme.black,
            ),
            Text(
              " Upload",
              style: GoogleFonts.openSans(
                color: AppTheme.black,
                fontWeight: FontWeight.w600,
                fontSize: Constant.smallbody(context),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class FunkyOverlay extends StatefulWidget {
  FunkyOverlay({super.key, required this.designationList});
  var designationList;

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(

    BuildContext context,
  ) {
    
    return  LayoutBuilder(

      builder: (context, constraints) {
        double widthfouty=  constraints.maxWidth>800? 40:20;
          double eigthy=  constraints.maxWidth>800? 80:30;
          double thirty=  constraints.maxWidth>800? 30:10;
        return Center(
          child: Material(
            color: Colors.transparent,
            child: ScaleTransition(
              scale: scaleAnimation!,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController, // Attach ScrollController
        
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:constraints.maxWidth>800? 30:10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/Group 26.png",
                          ),
                          SizedBox(
                            width: widthfouty,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: thirty),
                                SizedBox(height: thirty),
                                Text(
                                  "FULL TIME PROGRAMME",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Constant.smallbheadingText(context),
                                    letterSpacing: 3,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        widget.designationList["job_title"],
                                        style: GoogleFonts.openSans(
                                            color: AppTheme.whiteColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize:constraints.maxWidth>800? Constant.headingText(context):16,
                                            letterSpacing: 3,
                                            height: 0),
                                      ),
                                    ),
                                    if(constraints.maxWidth>800)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, left: 10),
                                      child: Image.asset(
                                        "assets/images/Group 41.png",
                                        height: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: widthfouty),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 800),
                                  child: Text(
                                    widget.designationList["description"],
                                    style: GoogleFonts.openSans(
                                      color: AppTheme.whiteColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: Constant.body(context),
                                      height: 1.6,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                SizedBox(height: thirty),
                                Row(
                                  children: [
                                    Text(
                                      "LOCATION- ",
                                      style: GoogleFonts.openSans(
                                        color: AppTheme.whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Constant.TextSize20(context),
                                        letterSpacing: 3,
                                      ),
                                    ),
                                    Text(
                                      widget.designationList["location"],
                                      style: GoogleFonts.openSans(
                                        color: AppTheme.whiteColor,
                                        fontSize: Constant.TextSize20(context),
                                        height: 1.5,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                                SizedBox(height: eigthy),
                                Container(
                                    constraints: BoxConstraints(maxWidth: 800),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: AppTheme.whiteColor,
                                            thickness: 0.3,
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10),
                                        //   child: Image.asset(
                                        //     "assets/images/arrow.png",
                                        //     height: 20,
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10),
                                        //   child: Image.asset(
                                        //     "assets/images/arrow.png",
                                        //     height: 20,
                                        //   ),
                                        // ),
                                      ],
                                    )),
                                SizedBox(height: eigthy),
                                Text(
                                  "Your Qualifications",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Constant.textFourtyEight(context),
                                    letterSpacing: 3,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ...List.generate(
                                  widget.designationList["keyresponsibilty"].length,
                                  (index) {
                                    return buildSection(
                                        widget.designationList["keyresponsibilty"]
                                            [index],
                                        context);
                                  },
                                ),
                                SizedBox(height: 80),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      constraints: BoxConstraints(maxWidth: 800),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: AppTheme.whiteColor,
                                              thickness: 0.3,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: eigthy),
                                Text(
                                  "Your Skills",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Constant.textFourtyEight(context),
                                    letterSpacing: 3,
                                  ),
                                ),
                                SizedBox(height: eigthy),
                                GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:constraints.maxWidth>800? 3:1, // 3 columns per row
                                    crossAxisSpacing: 100, // Space between columns
        
                                    childAspectRatio:
                                        2.2, // Adjust aspect ratio to balance title & description
                                  ),
                                  itemCount:
                                      widget.designationList["skills"].length,
                                  itemBuilder: (context, index) {
                                    return buildCard(
                                        widget.designationList["skills"][index]
                                            ['title']!,
                                        widget.designationList["skills"][index]
                                            ['description']!,
                                        context);
                                  },
                                ),
                                SizedBox(height: eigthy),
                                Container(
                                    constraints: BoxConstraints(maxWidth: 800),
                                    child: Divider(
                                      color: AppTheme.whiteColor,
                                      thickness: 0.3,
                                    )),
                                SizedBox(height: eigthy),
                                Text(
                                  "Key Responsibilities",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Constant.textFourtyEight(context),
                                    letterSpacing: 3,
                                  ),
                                ),
                                SizedBox(height: 20),
                                ...List.generate(
                                  widget.designationList["qualification"].length,
                                  (index) {
                                    return buildSection(
                                        widget.designationList["qualification"]
                                            [index],
                                        context);
                                  },
                                ),
                                SizedBox(height: eigthy),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                      constraints: BoxConstraints(maxWidth: 800),
                                      child: Row(
                                        children: [
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(right: 10),
                                          //   child: Image.asset(
                                          //     "assets/images/leftarrow.png",
                                          //     height: 20,
                                          //   ),
                                          // ),
                                          // Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(right: 10),
                                          //   child: Image.asset(
                                          //     "assets/images/leftarrow.png",
                                          //     height: 20,
                                          //   ),
                                          // ),
                                          Expanded(
                                            child: Divider(
                                              color: AppTheme.whiteColor,
                                              thickness: 0.3,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(height: eigthy),
                                Text(
                                  "What we Offer",
                                  style: GoogleFonts.openSans(
                                    color: AppTheme.whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Constant.textFourtyEight(context),
                                    letterSpacing: 3,
                                  ),
                                ),
                                SizedBox(height: thirty),
                                GridView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:constraints.maxWidth>800? 3:1, // 3 columns per row
                                    crossAxisSpacing: 100, // Space between columns
        
                                    childAspectRatio:
                                        2.2, // Adjust aspect ratio to balance title & description
                                  ),
                                  itemCount: widget.designationList["offer"].length,
                                  itemBuilder: (context, index) {
                                    return buildCard(
                                        widget.designationList["offer"][index]
                                            ['title']!,
                                        widget.designationList["offer"][index]
                                            ['description']!,
                                        context);
                                  },
                                ),
                                SizedBox(height: thirty),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: widthfouty,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: () {
                        _scrollController.animateTo(
                          0, // Scroll to top
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_upward, color: Colors.black),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset("assets/images/cross.svg")),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget buildCard(String title, String description, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: Constant.smallbheadingText(context),
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: 16),
        Text(
          description,
          style: GoogleFonts.openSans(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w300,
            fontSize: Constant.body(context),
          ),
        ),
      ],
    );
  }

  Widget buildSection(String titlepoints, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Image.asset(
            "assets/images/Vector.png",
            height: 16,
          ),
          SizedBox(width: 16),
          Flexible(
            child: Text(
              titlepoints,
              style: GoogleFonts.openSans(
                color: AppTheme.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: Constant.body(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
