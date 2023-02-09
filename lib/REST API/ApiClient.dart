import 'dart:convert';
import 'package:donotes/Style/Style.dart';
import 'package:http/http.dart' as http;

Future<bool> NoteCreateRequest(FormValues) async{
  var URL = Uri.parse("https://donotes.ideatech-bd.com/notes");
  var PostBody= json.encode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};

  var response = await  http.post(URL,headers:PostHeader,body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    SuccessToast("Request Successfull") ;
    return true;
  }
  else{
    ErrorToast("Request Failed! Try Again");
    return false;
  }
}

Future <List> NoteListRequest() async{

  var URL = Uri.parse("https://donotes.ideatech-bd.com/notes");
  var PostHeader = {"Content-Type": "application/json"};

  var response = await http.get(URL, headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    return ResultBody['noteList'];
  }
  else{
    ErrorToast("Request Failed! Try Again");
    return [];
  }
}

Future<bool> NoteDeleteRequest(id) async{
  var URL = Uri.parse("https://donotes.ideatech-bd.com/notes/"+id);
  var PostHeader = {"Content-Type": "application/json"};

  var response = await http.delete(URL, headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    SuccessToast("Request Successfull") ;
    return true;
  }
  else{
    ErrorToast("Request Failed! Try Again");
    return false;
  }
}

Future<bool> NoteUpdateRequest(FormValues, id) async{
  var URL = Uri.parse("https://donotes.ideatech-bd.com/notes/"+id);
  var PostBody= json.encode(FormValues);
  var PostHeader = {"Content-Type": "application/json"};

  var response = await  http.patch(URL,headers:PostHeader,body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = jsonDecode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){
    SuccessToast("Request Successfull") ;
    return true;
  }
  else{
    ErrorToast("Request Failed! Try Again");
    return false;
  }
}

Future <Map> SingleNoteRequest(id) async{

  var URL = Uri.parse("https://donotes.ideatech-bd.com/notes/"+id);
  var PostHeader = {"Content-Type": "application/json"};

  var response = await http.get(URL, headers: PostHeader);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']=="success"){

    return ResultBody['note'];

  }
  else{
    ErrorToast("Request Failed! Try Again");
    return {};
  }
}