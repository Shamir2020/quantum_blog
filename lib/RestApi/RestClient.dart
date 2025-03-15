import 'package:http/http.dart' as http;
import 'dart:convert';
var BaseUrl = 'http://10.0.2.2:8000';
// var BaseUrl = 'http://127.0.0.1:8000';
Future<List> getFeaturedBlogs() async{
  var url = Uri.parse('${BaseUrl}/getFeaturedBlogs');
  var response = await http.get(url,headers: {'Content-Type':'application/json','Accept':'application/json'},);
  var result = json.decode(response.body);
  if (response.statusCode == 200){
    return result['data'];
  }
  else{
    return [];
  }
}
Future<List> getAllBlogs() async{
  var url = Uri.parse("${BaseUrl}/getAllBlogs");
  var response = await http.get(url);
  var result = json.decode(response.body);
  if (response.statusCode == 200){
    return result['data'];
  }
  else{
    return [];
  }
}