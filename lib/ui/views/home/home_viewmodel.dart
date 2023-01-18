import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/enums/bottom_sheet_type.dart';
import 'package:stacked_app/enums/dialog_type.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  List<User> _users = [];

  List<User> get users => _users;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  Future<List<User>> getUsers() async {
    final response = await Dio().get('https://randomuser.me/api/?results=50');
    final data = response.data["results"] as List<dynamic>;

    final List<User> userList = data
        .map(
          (e) => User.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    _users = userList;
    log(users.toString());
    return _users;
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.dob,
    required this.phoneNo,
    required this.picture,
    required this.city,
    required this.state,
    required this.country,
  });

  final String name;
  final String email;
  final String dob;
  final String phoneNo;
  final String picture;
  final String city;
  final String state;
  final String country;

  factory User.fromMap(Map<String, dynamic> json) {
    log(json["name"]["first"].toString());
    String name =
        "${json["name"]["title"]} ${json["name"]["first"]} ${json["name"]["last"]} ";
    log(name);

    return User(
      name: name,
      email: json["email"],
      dob: json["dob"]["age"].toString(),
      phoneNo: json["phone"],
      picture: json["picture"]["medium"],
      city: json["location"]["city"],
      state: json["location"]["state"],
      country: json["location"]["country"],
    );
  }

  @override
  String toString() {
    return "name : $name, age $dob, country $country ";
  }
}
