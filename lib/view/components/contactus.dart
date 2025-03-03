import 'dart:io';
import 'dart:typed_data';

import 'package:archlelabswebsite/utils/globals.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  int selectIndex = 3;

  final formTypes = ["Hire", "Investors", "Press release", "Queries"];

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
                  fit: BoxFit.fill)),
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
        return buildHireForm(context);
      case 1:
        return buildInvestorForm(context);
      case 3:
        return buildPressRelease(context);
      default:
        return buildQueryForm(context);
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
                      "${formTypes[selectIndex]}",
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
                  padding: EdgeInsets.only(top: 10),
                  height: 45,
                  decoration: BoxDecoration(color: AppTheme.black),
                  child: Text(
                    "             Send",
                    style: GoogleFonts.openSans(
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Constant.body(context),
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
                      "${formTypes[selectIndex]}",
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
                  padding: EdgeInsets.only(top: 10),
                  height: 45,
                  decoration: BoxDecoration(color: AppTheme.black),
                  child: Text(
                    "             Send",
                    style: GoogleFonts.openSans(
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Constant.body(context),
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
                      "${formTypes[selectIndex]}",
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
                  padding: EdgeInsets.only(top: 10),
                  height: 45,
                  decoration: BoxDecoration(color: AppTheme.black),
                  child: Text(
                    "             Send",
                    style: GoogleFonts.openSans(
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Constant.body(context),
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
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select Designation',
                          style: GoogleFonts.openSans(
                              color: AppTheme.textBlackColor, fontSize: 13),
                        ),
                        items: _controller.designationList
                            .map<DropdownMenuItem<String>>((listfloors) {
                          return DropdownMenuItem<String>(
                            value: listfloors["job_title"].toString(),
                            child: Text(listfloors["job_title"].toString()),
                          );
                        }).toList(),
                        value: selectedDesignation,
                        onChanged: (String? value) {
                          setState(() {
                            selectedDesignation = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 30,
                          width: 200,
                          padding: const EdgeInsets.only(left: 8, right: 8),
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
                  _controller.createJob();
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 100),
                width: double.infinity,
                padding: EdgeInsets.only(top: 10),
                height: 45,
                decoration: BoxDecoration(color: AppTheme.black),
                child: Text(
                  "             Send",
                  style: GoogleFonts.openSans(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Constant.body(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
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
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    onTabPress(i);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                   //   borderRadius: BorderRadius.circular(12),
                      color: i == selectIndex
                          ? AppTheme.whiteColor
                          : AppTheme.black,
                    ),
                    child: Center(
                      child: Text(
                        "${formTypes[i]}",
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
                )),
                if (i + 1 < formTypes.length) ...[
                  SizedBox(width: 8), // Space between two containers
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      onTabPress(i + 1);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                       
                        color: i + 1 == selectIndex
                            ? AppTheme.whiteColor
                            : AppTheme.black,
                      ),
                      child: Center(
                        child: Text(
                          "${formTypes[i + 1]}",
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
                  )),
                ],
              ],
            ),
          ),
        SizedBox(
          height: 70,
        ),
        Text(
          "Contact Us",
          style: GoogleFonts.openSans(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: Constant.headingText(context),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget turpis quis ante condimentum ultrices. Fusce non diam vel mi consequat viverra eget at orci. Fusce non diam vel mi consequat viverra eget at orci.  ",
          style: GoogleFonts.openSans(
            color: AppTheme.whiteColor,
            fontSize: Constant.mediumbody(context),
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
          style: GoogleFonts.openSans(
            color: AppTheme.whiteColor,
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
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: i == selectIndex
                          ? AppTheme.whiteColor
                          : AppTheme.black,
                    ),
                    child: Center(
                      child: Text(
                        "${formTypes[i]}",
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
