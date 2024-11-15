import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/user.dart';

class HomeController extends GetxController {
  var users = <User>[].obs;

  Future<List<User>> getAllUsers() async {
    try {
      Uri url = Uri.parse(
          'https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);

        List? data = responseBody['items'];
        if (data != null && data.isNotEmpty) {
          List<User> userList = data.map((e) => User.fromJson(e)).toList();
          users.assignAll(userList);
          return userList;
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
