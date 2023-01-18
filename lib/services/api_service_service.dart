import 'dart:developer';

import 'package:dio/dio.dart';

import '../ui/views/home/home_viewmodel.dart';

class ApiServiceService {
  Future<List<User>> getUsers() async {
    final response = await Dio().get('https://randomuser.me/api/?results=50');
    final data = response.data["results"] as List<dynamic>;

    final List<User> userList = data
        .map(
          (e) => User.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    log(userList.toString());
    return userList;
  }
}
