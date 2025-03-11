import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as aa;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../utils/app_urls.dart';

class HomepageService {
  final String noInternetMessage =
      'Connection to API server failed due to internet connection';
  Future<Response> getBlogs() async {
    var ur = Uri.parse(AppUrls.BASE_URL + AppUrls.getBlogs + "?page=1&size=100");

    try {
      final response = await http.get(ur, headers: {
        "Content-Type": "application/json; charset=utf-8",
      });

      print(response.body);

      return Response(
        statusCode: response.statusCode,
        body: utf8.decode(response.body.codeUnits),
      );
    } on SocketException catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
 Future<Response> getOneBlogs(blogid) async {
    var ur = Uri.parse(AppUrls.BASE_URL + AppUrls.getoneBlogs + "?blog_id=$blogid");

    try {
      final response = await http.get(ur, headers: {
        "Content-Type": "application/json; charset=utf-8",
      });

      print(response.body);

      return Response(
        statusCode: response.statusCode,
        body: utf8.decode(response.body.codeUnits),
      );
    } on SocketException catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> getTeams() async {
    var ur = Uri.parse(AppUrls.BASE_URL + AppUrls.getTeams);

    try {
      final response = await http.get(ur, headers: {
        "Content-Type": "application/json; charset=utf-8",
      });

      print(response.body);

      return Response(
        statusCode: response.statusCode,
        body: utf8.decode(response.body.codeUnits),
      );
    } on SocketException catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> getDesignation() async {
    var ur = Uri.parse(AppUrls.BASE_URL + AppUrls.getDesignation);

    try {
      final response = await http.get(ur, headers: {
        "Content-Type": "application/json; charset=utf-8",
      });

      print(response.body);

      return Response(
        statusCode: response.statusCode,
        body: utf8.decode(response.body.codeUnits),
      );
    } on SocketException catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> createQuery(
      firstName, lastname, email, phone, subject, query, file) async {
    var ur = AppUrls.BASE_URL +
        AppUrls.queryForm +
        "?firstname=$firstName&lastname=$lastname&emailid=$email&phonenumber=$phone&subject=$subject&queries=$query";

    try {
      // var dio = aa.Dio();
      var request = http.MultipartRequest('POST', Uri.parse(ur));
      var multipartFile = http.MultipartFile.fromBytes(
        'filedata', // This should match the parameter name in your FastAPI endpoint
        file,
        filename: "aa.png",
        contentType: MediaType('application', 'octet-stream'),
      );
      request.files.add(multipartFile);

      // Send the request
      var response2 = await request.send();
      return Response(
        statusCode: response2.statusCode,
        // body:response2.stream.bytesToString(),
      );
    } catch (e) {
      print(e);
      return Response(
        statusCode: 1,
      );
    }
  }

  Future<Response> createInvestors(companyname, firstName, lastname, email,
      phone, typeofinvestor, file) async {
    var ur = AppUrls.BASE_URL +
        AppUrls.investorForm +
        "?companyname=$companyname&firstname=$firstName&lastname=$lastname&emailid=$email&phonenumber=$phone&typeofinvestor=$typeofinvestor";

    try {
      // var dio = aa.Dio();
      var request = http.MultipartRequest('POST', Uri.parse(ur));
      var multipartFile = http.MultipartFile.fromBytes(
        'filedata', // This should match the parameter name in your FastAPI endpoint
        file,
        filename: "aa.png",
        contentType: MediaType('application', 'octet-stream'),
      );
      request.files.add(multipartFile);

      // Send the request
      var response2 = await request.send();
      return Response(
        statusCode: response2.statusCode,
        // body:response2.stream.bytesToString(),
      );
    } catch (e) {
      print(e);
      return Response(
        statusCode: 1,
      );
    }
  }

  Future<Response> createPress(
      firstName, email, phone, subject, question, title, file) async {
    var ur = AppUrls.BASE_URL +
        AppUrls.pressform +
        "?name=$firstName&emailid=$email&phonenumber=$phone&subject=$subject&question=$question&title=$title";

    try {
      // var dio = aa.Dio();
      var request = http.MultipartRequest('POST', Uri.parse(ur));
      var multipartFile = http.MultipartFile.fromBytes(
        'filedata', // This should match the parameter name in your FastAPI endpoint
        file,
        filename: "pressimage.png",
        contentType: MediaType('application', 'octet-stream'),
      );
      request.files.add(multipartFile);

      // Send the request
      var response2 = await request.send();
      return Response(
        statusCode: response2.statusCode,
        // body:response2.stream.bytesToString(),
      );
    } catch (e) {
      print(e);
      return Response(
        statusCode: 1,
      );
    }
  }

    Future<Response> createJob(
      firstName,lastname, email, phone, designation, linkedin, experience, file) async {
    var ur = AppUrls.BASE_URL +
        AppUrls.jobForm +
       "?firstname=$firstName&lastname=$lastname&emailid=$email&phonenumber=$phone&designation=$designation&linkedin=$linkedin&experience=%$experience";

    try {
      // var dio = aa.Dio();
      var request = http.MultipartRequest('POST', Uri.parse(ur));
      var multipartFile = http.MultipartFile.fromBytes(
        'filedata', // This should match the parameter name in your FastAPI endpoint
        file,
        filename: "experienc2e.png",
        contentType: MediaType('application', 'octet-stream'),
      );
      request.files.add(multipartFile);

      // Send the request
      var response2 = await request.send();
      return Response(
        statusCode: response2.statusCode,
        // body:response2.stream.bytesToString(),
      );
    } catch (e) {
      print(e);
      return Response(
        statusCode: 1,
      );
    }
  }
}
