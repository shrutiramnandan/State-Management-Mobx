import 'dart:convert';

import 'package:bloc_demo/constants/constants.dart';
import 'package:bloc_demo/model/post.dart';
import 'package:bloc_demo/model/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiService {

  List<User> users = [];
  List<Post> posts = [];

  Future getData(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      users = (data['data'] as List).map((json) {
        return User.fromJson(json);
      }).toList();
      return users;
    } else {
      print("Error in URL");
    }
  }

  Future getPosts(String url) async {
     Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      posts = (data as List).map((json) {
        return Post.fromJson(json);
      }).toList();
      return posts;
    } else {
      print("Error in URL");
    }
  }

  Future<String> nonce()async{
    String url = "$BASE_URL/api/get_nonce/?controller=user&method=register";
     Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var noncee = data['nonce'];
      print("nonce api NONCE :$data");
      return noncee;
    } else {
      print("Error in NONCE URL");
      throw "Error in NONCE URL";
      
    }


  }

  Future authentication(String username, String password)async{
    String url = "$BASE_URL/wp-json/jwt-auth/v1/token";
     Uri uri = Uri.parse(url);
    final response = await http.post(uri,
    body: {
      "username":username,
      "password":password,
    }
    );
    if (response.statusCode == 200) {
      
      final data = jsonDecode(response.body);
      Fluttertoast.showToast(msg: "$data");
      print("AUTHENTICATION API RESPONSE:$data");
     
      return data;
    } else {
      print("Error in AUTHENTICATION URL");
    }


  }

  Future registration({
    String username,
    String userpass, 
    String displayName,
    String email, 
    String nonce })async{
    String url = "$BASE_URL/api/user/register?username= $username&user_pass= $userpass&display_name= $displayName&email= $email&nonce=$nonce";
     Uri uri = Uri.parse(url);
    final response = await http.post(uri);
    final data = jsonDecode(response.body);
    print("registration API RESPONSE:$data");
    
     print("response statusCode response response:${response.statusCode}");
    if (data['status'] == "ok") { //response.statusCode == 200
      Fluttertoast.showToast(msg: "New user Registered");
      return data;
    } else {
       Fluttertoast.showToast(msg: data['error']);
       print("Error in registration URL");
      return  data['error'];
     
    }


  }
}