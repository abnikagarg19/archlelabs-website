import 'package:archlelabswebsite/view/blog_details.dart';
import 'package:archlelabswebsite/view/home.dart';
import 'package:get/get.dart';

import '../bindngs.dart/blog_bindings.dart';

class Routes {
  static String home = '/';

  static String blog = '/blog';
}

appRoutes() => [
      GetPage(
        name: Routes.home,
        page: () => HomeWidgets(),
      ),
      GetPage(
          name: Routes.blog,
          page: () => BlogDetails(),
          binding: BlogBindings()),
    ];
