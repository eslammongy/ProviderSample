import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:provider_sample/model/user_model.dart';

class UserNotifier extends ChangeNotifier {
  final List<UserModel> _usersList = [];

  int _age = 0;
  int _height = 0;

  UnmodifiableListView<UserModel> get usersList =>
      UnmodifiableListView(_usersList);

  int get age => _age;
  int get height => _height;

  late bool _darkThemeEnabled;
  bool get darkTheme => _darkThemeEnabled; //Getter
  UserNotifier() {
    _darkThemeEnabled = true;
  }

  toggleTheme() {
    _darkThemeEnabled = !_darkThemeEnabled;
    notifyListeners();
  }

  void addNewUser(UserModel userModel) {
    _usersList.add(userModel);
    notifyListeners();
  }

  void deleteSelectedUser(int index) {
    _usersList.removeWhere(
        (element) => element.userName == usersList[index].userName);
    notifyListeners();
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }

  void incrementHeight() {
    _height++;
    notifyListeners();
  }
}
