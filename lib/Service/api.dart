import 'package:conference/Service/authdata.dart';
import 'package:conference/Helpers/helper.dart';
import 'package:dio/dio.dart';

class Api {
  Dio http = Dio();

  // String Host = 'http://10.0.2.2:8000/api/';
  // String Host = 'http://192.168.87.160:8000/api/';
  // String Host = 'http://192.168.8.101:8000/api/';
  // String Host = 'http://192.168.100.69:8000/api/';
  // String Host = 'http://192.168.0.179:8000/api/';
 String Host = 'https://conference.arconigeria.org/api/';


  Api()  {
    http.options =  BaseOptions(headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8'
    });
  }

  checkAuth() async {
    http.options.baseUrl = Host;
    String? token = await AuthData.getToken();
    if (token != null) {
      http.interceptors.clear();
      http.interceptors.add(
          InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
        // Do something before request is sent
        // print(token);
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      }, onResponse: (Response response, handler) {
        // Do something with response data
            print('response.statusCode');
            print(response.statusCode);
        if (response.statusCode == 403) {
          print(response.data);
         print('unauthenticated');
//           AuthData.Logout();
        }
//        print(response);
        return handler.next(response); // continue
      }, onError: (DioError error, handler) async {

            // print(error.response?.statusCode );
        // Do something with response error
       print(error.response);
        if (error.response?.statusCode == 403) {
           print('unauthenticated');
        print(error.message);
        closeLoading();
          AuthData.Logout();
        } else {
          return handler.next(error);
        }
      }));
    }
  }

  Future<Map> get(String path,
      {Map<String, dynamic>? body, Options? options}) async {

    await checkAuth();
    print(Host);
    print(path);
//    print(body);
    try {
      Response response =
          await http.get(path, queryParameters: body, options: options);

      print(response);
      return {
        'status': response.statusCode,
        'message': response.statusMessage,
        'data': response.data,
        'header': response.headers
      };
    } on DioError catch (e) {
      print(e.response);
      // Map err = e.response!.data;
      // String errMessage = "An error occurred while making contacting server!!";

      Map<String, dynamic> ret = {
        'status': e.response?.statusCode,
        'message': e.response!.statusMessage,
        'header': e.response!.headers,
        'data': e.response!.data
      };
      return ret;
    } catch (e) {
      print('error');
      print(e);
      Map<String, dynamic> ret = {
        'status': 405,
        'message': "An error occurred while making contacting server!!",
        'headers': {},
        'data': []
      };
      return ret;
    }
  }

  Future<Map> post(String path,
      {Map<String, dynamic>? body, Options? options}) async {

    await checkAuth();
    print(Host);
    print(path);
    try {
      Response response = await http.post(path, data: body, options: options);
      print(response);
      return {
        'status': response.statusCode,
        'message': response.statusMessage,
        'data': response.data,
        'header': response.headers
      };
    } on DioError catch (e) {
      print(e.response);
      Map<String, dynamic> ret = {};
      if(e.response == null){
        ret = {
          'status': 405,
          'message': "An error occurred while contacting server!!",
          'header': Headers(),
          'data': []
        };
      }else{
         ret = {
          'status': e.response!.statusCode,
          'message':e.response!.statusMessage,
          'header':e.response!.headers,
          'data': e.response!.data
        };
      }
      return ret;
    } catch (e) {
      print('error');
      Map<String, dynamic> ret = {
        'status': 405,
        'message': "An error occurred while contacting server!!",
        'header': Headers(),
        'data': []
      };
      return ret;
    }
  }

Future<Map> postFormData(String path,
      {FormData? body, Options? options}) async {

    await checkAuth();
    print(Host);
    print(path);
    try {
      Response response = await http.post(path, data: body, options: options);
      print(response);
      return {
        'status': response.statusCode,
        'message': response.statusMessage,
        'data': response.data,
        'header': response.headers
      };
    } on DioError catch (e) {
      print(e.response);


      Map<String, dynamic> ret = {
        'status': e.response!.statusCode,
        'message':e.response!.statusMessage,
        'header':e.response!.headers,
        'data': e.response!.data
      };
      return ret;
    } catch (e) {
//print('error');
      Map<String, dynamic> ret = {
        'status': 405,
        'message': "An error occurred while contacting server!!",
        'header': Headers(),
        'data': []
      };
      return ret;
    }
  }


Future<Map> delete(String path,
      {Map<String, dynamic>? body, Options? options}) async {

    await checkAuth();
    print(Host);
    print(path);
    try {
      Response response = await http.delete(path, data: body, options: options);
      print(response);
      return {
        'status': response.statusCode,
        'message': response.statusMessage,
        'data': response.data,
        'header': response.headers
      };
    } on DioError catch (e) {
      print(e.response);

      Map err = e.response!.data;
      String errMessage = "An error occurred while making contacting server!!";

      Map<String, dynamic> ret = {
        'status': e.response!.statusCode,
        'message': e.response!.statusMessage,
        'header': e.response!.headers,
        'data': []
      };
      return ret;
    } catch (e) {
//print('error');
      Map<String, dynamic> ret = {
        'status': 405,
        'message': "An error occurred while contacting server!!",
        'header': Headers(),
        'data': []
      };
      return ret;
    }
  }


  String? getCookie(Response response) {
    String? rawCookie = response.headers.value("set-cookie");
    String resultCookie = "";
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      resultCookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
      index = resultCookie.indexOf('=');
      resultCookie = (index == -1) ? rawCookie : rawCookie.substring(index+1, resultCookie.length);
      return resultCookie;
    }
    return null;
  }
}
