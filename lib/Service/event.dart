import 'package:conference/Models/response.dart';
import 'package:dio/dio.dart' as dio;

import 'api.dart';

class EventService {


  home() async {
    String path = 'home';
    Api api = Api();
    Map data = await api.get(path);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

//
  allEvents(Map<String, dynamic> body) async {
    String path = 'allevents';
    Api api = Api();
    Map data = await api.get(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  getFees(Map<String, dynamic> body) async {
    String path = 'getfees';
    Api api = Api();
    Map data = await api.get(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  myEvents(Map<String, dynamic> body) async {
    String path = 'myevents';
    Api api = Api();
    Map data = await api.get(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  getEvent(Map<String, dynamic> body) async {
    String path = 'getevent';
    Api api = Api();
    Map data = await api.get(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  getCurrentEvent() async {
    String path = 'getcurrentevent';
    Api api = Api();
    Map data = await api.get(path);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  getSpeakers(Map<String, dynamic> body) async {
    String path = 'eventspeakers';
    Api api = Api();
    Map data = await api.get(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  getSponsors(Map<String, dynamic> body) async {
    String path = 'eventsponsors';
    Api api = Api();
    Map data = await api.get(path, body: body);
//     print(data);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }

  getPaystackKey() async {
    String path = 'get_paystack_key';
    Api api = Api();
    Map data = await api.get(path);
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  initPaystack(Map body) async {
    String path = 'init_paystack';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
    return Response.fromJson(Map<String, dynamic>.from(data));
  }
  makePayment(Map body) async {
    String path = 'event_payment';
    Api api = Api();
    Map data = await api.post(path, body: Map<String, dynamic>.from(body));
    return Response.fromJson(Map<String, dynamic>.from(data));
  }



}
