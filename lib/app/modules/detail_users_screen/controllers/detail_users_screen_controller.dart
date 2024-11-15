import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/detail_user.dart';

class DetailUsersScreenController extends GetxController {
  var detailUser = Rxn<DetailUser>();

  Future<DetailUser?> fetchDetailUser(String username) async {
    try {
      Uri url = Uri.parse('https://api.github.com/users/$username');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return DetailUser.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
