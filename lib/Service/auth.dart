import 'package:conference/Models/response.dart';
import 'package:dio/dio.dart' as dio;

import 'api.dart';

class Auth {
  appendParam(List param) {
    String urlParam = '';
    for (String e in param) {
      urlParam += '/$e';
    }
    return urlParam;
  }

  Register(Map<String, dynamic> body) async {
    String path = 'register';
    Api api = Api();
    Map data = await api.post(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  Login(Map body) async {
    String path = 'login';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }


  Logout() async {
    String path = 'logout';
    Api api = Api();
    Map data = await api.post(path);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  Forgot(Map body) async {
    String path = 'forgot';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  Verify(Map body) async {
    String path = 'verify';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  Reset(Map body) async {
    String path = 'reset';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  getUser() async {
    String path = 'getuser';
    Api api =  Api();
    Map data = await api.get(path);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  saveUser(Map body) async {
    String path = 'saveuser';
    Api api =  Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  checkReferral(Map body) async {
    String path = 'check_referral';
    Api api =  Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  homeDetails() async {
    String path = 'home';
    Api api = Api();
    Map data = await api.get(path);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  changePassword(Map body) async {
    String path = 'change_password';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  checkAllVerifications() async {
    String path = 'check_all_verification';
    Api api = Api();
    Map data = await api.get(path);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  getBVNDetails() async {
    String path = 'get_bvn_details';
    Api api = Api();
    Map data = await api.get(path);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  verifyBVNDetails(Map body) async {
    String path = 'verify_bvn_details';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  verifyIdDetails(dio.FormData body) async {
    String path = 'verify_id_details';
    Api api = Api();
    Map data = await api.postFormData(path, body: body);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  updateProfile(Map body) async {
    String path = 'update_profile';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
}
