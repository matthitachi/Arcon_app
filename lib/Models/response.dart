import 'dart:convert';

import 'package:dio/dio.dart';

class Response {
  int status;
  String message;
  dynamic _data;
  Headers header;

  get data{
  return _data;
  }
  set data(data){

   _data = data;
  }
  Response(this.status, this.message, this.header, {data}){
    if(status == 401){

      _data = List.from(data.values.map((elem){
        return elem[0];
      }));
      this.message = _data[0].toString();
    }else{
      _data = data;
    }
  }

  factory Response.fromJson( Map<String, dynamic> parsedJson) {

    return Response(parsedJson['status'], parsedJson['message'],
        parsedJson['header'], data: parsedJson['data']);
  }
//
  Map<String, dynamic> toJson() {
    return {
      "status": this.status,
      "message": this.message,
      "header": this.header,
      "data": jsonEncode(data)
    };
  }

}
