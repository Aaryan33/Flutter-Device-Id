import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;



class ApiHandler {

  static Future<dynamic> post ({String? url, body}) async {
    dprint(String? text){
      bool isDebug = false;
      assert(isDebug = true); // This line will only execute in debug mode.

      if (isDebug) {
        // Log messages meant for debugging
        // print('Debug mode is enabled');
        print(text);
      }
    }
    try {
      dprint("\nUrl : "+url.toString());
      dprint("\n" + url.toString().split("/").last + "Read : "+body.toString());
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      http.Response response = await http.post(Uri.parse(url!), headers: headers, body: body);

      dprint("StatusCode : " + response.statusCode.toString());
      dprint(url.toString().split("/").last + " -- Body : " + response.body.toString());
      return response;
    } on FormatException {
      // throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      // throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      // throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      // throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }

  static Future<dynamic> get ({String? url}) async {
    dprint(String? text){
      bool isDebug = false;
      assert(isDebug = true); // This line will only execute in debug mode.

      if (isDebug) {
        // Log messages meant for debugging
        // print('Debug mode is enabled');
        print(text);
      }
    }
    try {
      dprint("\nUrl : "+url.toString());
      http.Response response = await http.get(Uri.parse(url!));

      dprint("StatusCode : " + response.statusCode.toString());
      dprint(url.toString().split("/").last + " -- Body : " + response.body.toString());
      return response;
    } on FormatException {
      // throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      // throw ErrorHandler(message: "Internet Connectino Failure");
    } on HttpException {
      // throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      // throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }

}