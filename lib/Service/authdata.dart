import 'dart:convert';
import 'package:conference/Models/user.dart';
import 'package:conference/Service/locatorService.dart';
import 'package:conference/Service/navigationService.dart';
import 'package:conference/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthData{
  static setToken(token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('AuthToken', token);
  }
  static setDeviceToken(token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('DeviceToken', token);
  }
  static Future<String?> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('AuthToken');
    return token;
  }
  static Future<String?> getDeviceToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('DeviceToken');
    return token;
  }

  static setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('User', jsonEncode(user));
  }
  static Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('User');
    print(data);
    User user = User.fromJson(jsonDecode(data!));
    return user;
  }



  static Logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("User");
    prefs.remove("AuthToken");
    // locator<NavigationService>().pushReplacementNamed(LOGIN);
    locator<NavigationService>()
        .pushNamedAndRemoveUntil(
        LOGIN);
  }



}