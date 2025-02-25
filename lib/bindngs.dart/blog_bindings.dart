
import 'package:archlelabswebsite/controller/blogController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BlogBindings extends Bindings {
  @override
 void dependencies() {
    
      Get.lazyPut<BlogController>(
      () => BlogController(),
    );
  }
}
