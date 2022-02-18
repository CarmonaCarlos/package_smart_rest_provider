import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:smart_common_shared/smart_common_shared.dart';

class RestMethods{

  final String endPoint;

  RestMethods({required this.endPoint});

  Future<APIResponse> listAll(String method, String token, String logName) async{
    try{
      String fullEndPoint = endPoint + method;
      var response = await http.get(Uri.parse(fullEndPoint), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'});
      if(response.statusCode == 200)
      {
        dev.log('Request to: $fullEndPoint success!', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: json.decode(response.body));
        return apiResponse;
      }else{
        dev.log('Request to: $fullEndPoint finished with error, code: ${response.statusCode}, body: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }
    }catch(ex)
    {
      dev.log('Unknown error', name: logName, level: LogLevel.error.index, time: DateTime.now(), error: ex);
      APIResponse apiResponse = APIResponse(statusCode: -1, data: null);
      return apiResponse;
    }
  }

  Future<APIResponse> unAuthPost({required String method, required String jsonData, required String logName}) async{
    try{
      String fullEndPoint = endPoint + method;
      var response = await http.post(Uri.parse(fullEndPoint), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json; charset=UTF-8'}, body: jsonData);
      if(response.statusCode == 200)
      {
        dev.log('Request to: $fullEndPoint success!', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }else{
        dev.log('Request to: $fullEndPoint finished with error, code: ${response.statusCode}, body: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }
    }catch(ex)
    {
      dev.log('Unknown error', name: logName, level: LogLevel.error.index, time: DateTime.now(), error: ex);
      APIResponse apiResponse = APIResponse(statusCode: -1, data: null);
      return apiResponse;
    }
  }


  Future<APIResponse> get(String method,String token, String logName) async{
    try{
      String fullEndPoint = endPoint + method;
      var response = await http.get(Uri.parse(fullEndPoint), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'});
      if(response.statusCode == 200)
      {
        dev.log('Request to: $endPoint success!', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: json.decode(response.body));
        return apiResponse;
      }else{
        dev.log('Request to: $fullEndPoint finished with error, code: ${response.statusCode}, body: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }
    }catch(ex)
    {
      dev.log('Unknown error', name: logName, level: LogLevel.error.index, time: DateTime.now(), error: ex);
      APIResponse apiResponse = APIResponse(statusCode: -1, data: null);
      return apiResponse;
    }
  }

  Future<APIResponse> insert(String method,String rawJson, String token, String logName) async{
    try{
      String fullEndPoint = endPoint + method;
      var response = await http.post(Uri.parse(fullEndPoint), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'}, body: rawJson);
      if(response.statusCode == 200 || response.statusCode == 201)
      {
        dev.log('Request to: $fullEndPoint success!', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: json.decode(response.body));
        return apiResponse;
      }else{
        dev.log('Request to: $fullEndPoint finished with error, code: ${response.statusCode}, body: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }
    }catch(ex)
    {
      dev.log('Unknown error', name: logName, level: LogLevel.error.index, time: DateTime.now(), error: ex);
      APIResponse apiResponse = APIResponse(statusCode: -1, data: '');
      return apiResponse;
    }
  }

  Future<APIResponse> update(String method, String rawJson, String token, String logName) async{
    try{
      String fullEndPoint = endPoint + method;
      var response = await http.put(Uri.parse(fullEndPoint), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'}, body: rawJson);
      if(response.statusCode == 200 || response.statusCode == 201)
      {
        dev.log('Request to: $fullEndPoint success!', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        dev.log('Response in json: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: json.decode(response.body));
        return apiResponse;
      }
      else{
        dev.log('Request to: $fullEndPoint finished with error, code: ${response.statusCode}, body: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }
    }catch(ex)
    {
      dev.log('Unknown error', name: logName, level: LogLevel.error.index, time: DateTime.now(), error: ex);
      APIResponse apiResponse = APIResponse(statusCode: -1, data: '');
      return apiResponse;
    }
  }

  Future<APIResponse> delete(String method,int id, String token, String logName) async{
    try{
      String fullEndPoint = endPoint + method;
      var response = await http.delete(Uri.parse(fullEndPoint + '/$id'), headers: { 'Content-Type': 'application/json', 'Accept': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'});
      if(response.statusCode == 200 || response.statusCode == 201)
      {
        dev.log('Request to: $fullEndPoint success!', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: '');
        return apiResponse;
      }else{
        dev.log('Request to: $fullEndPoint finished with error, code: ${response.statusCode}, body: ${response.body.toString()}', name: logName, level: LogLevel.debug.index, time: DateTime.now());
        APIResponse apiResponse =  APIResponse(statusCode: response.statusCode, data: jsonDecode(response.body));
        return apiResponse;
      }
    }catch(ex)
    {
      dev.log('Unknown error', name: logName, level: LogLevel.error.index, time: DateTime.now(), error: ex);
      APIResponse apiResponse = APIResponse(statusCode: -1, data: '');
      return apiResponse;
    }
  }

}


