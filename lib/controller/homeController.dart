import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archlelabswebsite/models/TeamModel.dart';
import 'package:archlelabswebsite/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/BlogModel.dart';
import '../serices/home_repo.dart';
import '../utils/dailog.dart';

class HomeController extends GetxController {
  bool isLoaded = false;
  List<BlogModel> blogsList = [];
  List<Items> blogsListItems = [];
  int hoverIndex = -1;
  @override
  void onInit() {
    super.onInit();
    Globals.scrollController.addListener(_onScroll);

    print("dhn");
   // getTeams();
    ///getDesignations();
    //getAllBlogs();
  }

  Timer? _scrollEndTimer;

  void _onScroll() {
    offset.value = Globals.scrollController.offset;

    /// Reset previous timer if scrolling continues
    _scrollEndTimer?.cancel();

    /// Wait for 500ms after scrolling stops, then keep image visible for a bit
    _scrollEndTimer = Timer(Duration(milliseconds: 500), () {
      Future.delayed(Duration(seconds: 1), () {
        offset.value =
            Globals.scrollController.offset; // Ensure image stays for a bit
      });
    });
  }

  @override
  void dispose() {
    Globals.scrollController.dispose();
    _scrollEndTimer?.cancel();
    super.dispose();
  }

  hovering(index) {
    hoverIndex = index;
  }

  exithovering(index) {
    hoverIndex = -1;
  }

  void getAllBlogs() async {
    blogsList.clear();
    HomepageService().getBlogs().then((value) {
      switch (value.statusCode) {
        case 200:
          isLoaded = true;

          final decodedData = jsonDecode(value.body);
          blogsListItems.clear();
          if (decodedData['data']!.length != 0) {
            blogsList.add(BlogModel.fromJson(decodedData));
            blogsListItems = blogsList.first.data!.items!;
          }

          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }

  List<TeamModel> teamList = [];
  List<TeamModel> adviroteamList = [];
  final firstnameQuery = TextEditingController();
  final lastnameQuery = TextEditingController();
  final emailQuery = TextEditingController();
  final phoneQuery = TextEditingController();
  final subjectQuery = TextEditingController();
  String filequeryname = "";
  final queryQuery = TextEditingController();
  void getTeams() async {
    teamList.clear();
    HomepageService().getTeams().then((value) {
      switch (value.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);
          teamList.add(TeamModel.fromJson(decodedData));
         
          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }

  Uint8List? filequery;
  selectFile(files, name) {
    filequeryname = name;
    filequery = files;
    print(filequery);
    update();
  }

  RxDouble offset = 0.0.obs;
  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    offset.value = scrollNotification.metrics.pixels;
    print(scrollNotification.metrics.pixels);
    return true;
  }

  bool isOurStory = false;
  changeOurStory(value) {
    isOurStory = value;
    update();
  }

  bool isTeam = false;
  changeIsTeam(value) {
    isTeam = value;
    update();
  }

  bool isVlaueSection = false;
  changeisVlaueSection(value) {
    isVlaueSection = value;
    update();
  }

  bool isMissionSection = false;
  changeisMissionSection(value) {
    isMissionSection = value;
    update();
  }

  bool isAboutuseVisble = false;
  changeAboutus() {
    isAboutuseVisble = true;
    update();
  }

  changenotAboutus() {
    isAboutuseVisble = false;
    update();
  }

  bool isOurFocus = false;
  changeisOurFocus() {
    isOurFocus = true;
    update();
  }

  changeisOurFocusNot() {
    isOurFocus = false;
    update();
  }

  clearQuery() {
    firstnameQuery.clear();
    lastnameQuery.clear();
    emailQuery.clear();
    phoneQuery.clear();
    queryQuery.clear();
    subjectQuery.clear();
    filequery = null;
    filequeryname = "";
    update();
  }

  createQueryForm() {
    DialogHelper.showLoading();
    HomepageService()
        .createQuery(firstnameQuery.text, lastnameQuery.text, emailQuery.text,
            phoneQuery.text, subjectQuery.text, queryQuery.text)
        .then((value) {
      DialogHelper.hideLoading();
      switch (value.statusCode) {
        case 200:
          DialogHelper.showSuccessDialog(
              () {}, "Query", "Submited Successfully");
          clearQuery();
          break;
        // case 1:

        //   break;
        default:
          DialogHelper.showErroDialog(description: "Something went wrong");
          break;
      }
    });
  }

  final companyname = TextEditingController();
  final firstNameInvestor = TextEditingController();

  final lastnameInvestor = TextEditingController();
  final emailInvestor = TextEditingController();
  final phoneInvestor = TextEditingController();
  final typeofinvestor = TextEditingController();
  String fileInvestorname = "";
  Uint8List? fileInvestors;
  selectFileInvestors(files, name) {
    fileInvestors = files;
    fileInvestorname = name;
    update();
  }

  clearInvestors() {
    companyname.clear();
    firstNameInvestor.clear();
    lastnameInvestor.clear();
    emailInvestor.clear();
    phoneInvestor.clear();
    typeofinvestor.clear();
    fileInvestors = null;
    fileInvestorname = "";
    update();
  }

  createInvestors() {
    DialogHelper.showLoading();
    HomepageService()
        .createInvestors(
            companyname,
            firstNameInvestor.text,
            lastnameInvestor.text,
            emailInvestor.text,
            phoneInvestor.text,
            typeofinvestor,
            fileInvestors)
        .then((value) {
      DialogHelper.hideLoading();
      switch (value.statusCode) {
        case 200:
          DialogHelper.showSuccessDialog(
              () {}, "Investors", "Submited Successfully");
          clearInvestors();
          break;
        // case 1:

        //   break;
        default:
          DialogHelper.showErroDialog(description: "Something went wrong");
          break;
      }
    });
  }

  final namePress = TextEditingController();

  final subjectPress = TextEditingController();
  final emailPress = TextEditingController();
  final phonePress = TextEditingController();
  final titlePress = TextEditingController();
  final quesPress = TextEditingController();
  String fileePressRelasename = "";
  Uint8List? fileePressRelase;
  selectFileePressRelase(files, name) {
    fileePressRelase = files;
    fileePressRelasename = name;
    update();
  }

  clearePressRelase() {
    namePress.clear();
    subjectPress.clear();
    emailPress.clear();
    phonePress.clear();

    titlePress.clear();
    fileePressRelase = null;
    fileePressRelasename = "";
    update();
  }

  createPressRelase() {
    DialogHelper.showLoading();
    HomepageService()
        .createPress(namePress.text, emailPress.text, phonePress.text,
            subjectPress, quesPress.text, titlePress.text, fileePressRelase)
        .then((value) {
      DialogHelper.hideLoading();
      switch (value.statusCode) {
        case 200:
          DialogHelper.showSuccessDialog(
              () {}, "Press Release", "Submited Successfully");
          clearePressRelase();
          break;
        // case 1:

        //   break;
        default:
          DialogHelper.showErroDialog(description: "Something went wrong");
          break;
      }
    });
  }

  final firstNameJob = TextEditingController();
  final lastNameJob = TextEditingController();

  final exp = TextEditingController();
  final linkedin = TextEditingController();
  final emailJob = TextEditingController();
  final phoneJob = TextEditingController();
  final designation = TextEditingController();
  // String filejobName = "";
  // Uint8List? fileeJob;
  // selectFileeJob(files, name) {
  //   fileeJob = files;
  //   filejobName = name;
  //  Get.forceAppUpdate();
  // }
  RxString filejobName = ''.obs;
  var fileeJob = Rx<Uint8List?>(null);

  selectFileeJob(Uint8List files, String name) {
    fileeJob.value = files;
    filejobName.value = name;
    Get.forceAppUpdate(); // to trigger the update
  }

  cleareJob() {
    firstNameJob.clear();
    lastNameJob.clear();
    exp.clear();
    emailJob.clear();
    designation.clear();
    linkedin.clear();
    phoneJob.clear();
    fileeJob.value = null;
    filejobName.value = "";
    update();
  }

  createJob() {
    DialogHelper.showLoading();
    HomepageService()
        .createJob(firstNameJob.text, lastNameJob.text, emailJob.text,
            phoneJob.text, designation, linkedin.text, exp.text, fileeJob.value)
        .then((value) {
      DialogHelper.hideLoading();
      switch (value.statusCode) {
        case 200:
          DialogHelper.showSuccessDialog(
              () {}, "Designation", "Applied Successfully");
          cleareJob();
          break;
        // case 1:

        //   break;
        default:
          DialogHelper.showErroDialog(description: "Something went wrong");
          break;
      }
    });
  }

  List designationList = [];
  void getDesignations() async {
    designationList.clear();
    HomepageService().getDesignation().then((value) {
      switch (value.statusCode) {
        case 200:
          isLoaded = true;
          final decodedData = jsonDecode(value.body);
          designationList = decodedData["data"];

          update();
          break;
        case 401:
          Get.offAndToNamed("/login");
          //DialogHelper.showErroDialog(description: "Token not valid");
          break;
        case 1:
          break;
        default:
          break;
      }
    });
  }
}
