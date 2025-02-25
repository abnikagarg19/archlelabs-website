import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Blog.dart';
import '../serices/home_repo.dart';
import '../utils/dailog.dart';

class BlogController extends GetxController {
  bool isLoaded = false;
  List<Blog> blogsList = [];
  Data blogsListItems =Data();
  @override
  void onInit() {
    super.onInit();

    print("details");
    getBlog();
  }

  void getBlog() async {
    blogsList.clear();
    HomepageService().getOneBlogs(Get.parameters['id']).then((value) {
      switch (value.statusCode) {
        case 200:
          isLoaded = true;

          final decodedData = jsonDecode(value.body);
         
        //  if (decodedData['data']!.length != 0) {
            blogsList.add(Blog.fromJson(decodedData));
            blogsListItems = blogsList.first.data!;
        ///  }

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
