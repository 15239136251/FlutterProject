import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(child: Text('HomePage'),),
    );
  }

  void getHttp() async{
    try{
      Response response;  // 服务器将要返回的对象
      response = await Dio().get("https://www.easy-mock.com/mock/5e1c3ead6a44945ea7bd292d/example/mocks");
      return print(response);
    }catch(e){
      return print(e);
    }
  }


}