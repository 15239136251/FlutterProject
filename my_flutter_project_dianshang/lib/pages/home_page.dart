import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
const url_1 = "https://www.fastmock.site/mock/2fc52011392efae4c2593864195764b7/datou/xiaotoubaba";


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController typeController = TextEditingController();
  String showText = '欢迎您来到儿童动画人物选择';

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(title: Text('跑完'),),
         body: Container(
           child: Column(
             children: <Widget>[
               TextField(
                 controller: typeController,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.all(10.0),
                   labelText: '儿童动画',
                   helperText: '请输入你喜欢的人物',
                 ), //修饰文本框
                 autofocus: false,
               ),  //文本框
               RaisedButton(
                 onPressed: _choiceAction,
                 child: Text('选择完毕'),
               ), //按钮
               Text(
                 showText,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 1,
               )
             ],
           ),
         ),
       ),
    );
  }


  void _choiceAction(){
    print('开始选择你喜欢的人物........................');
    if(typeController.text.toString() ==""){ //判断文本框是否为空
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text('人物不能为空'),)
      );
    }else{
      getHttp(typeController.text.toString()).then((val){
        setState(() {
          showText = val['data']['name'].toString();
          print(showText);
        });
      });
    }
  }

  Future getHttp(String TypeText) async {
    try {
      Response  response;
      var data = {'name':TypeText};
      response = await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian',
        queryParameters: data
      );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

}