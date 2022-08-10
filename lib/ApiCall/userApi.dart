 import 'dart:convert';

import 'package:demoproject/model/userModel.dart';
import 'package:http/http.dart ' as http;

 userApi()async{
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");     
    var response =  await   http.get(url);
     
           
              if(response.statusCode == 200){
                    return UserModel.fromJson(jsonDecode(response.body));
              } 

 }