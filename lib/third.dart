import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class ThirdViewController extends StatefulWidget {
  Third createState() => Third();
}

class Third extends State<ThirdViewController> {
  // 注册一个通知
  static const EventChannel eventChannel =
      const EventChannel('samples.flutter.io/flutterPush');

  // 渲染前的操作，类似viewDidLoad
  @override
  void initState() {
    super.initState();

    // 监听事件，同时发送参数12345
    eventChannel
        .receiveBroadcastStream(12345)
        .listen(onEvent, onError: onError);
  }

  String naviTitle = 'title';

  // 回调事件
  void onEvent(Object event) {
    setState(() {
      naviTitle = event.toString();
      httpRequest();
    });
  }

  // 错误返回
  void onError(Object error) {}

  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      theme: new CupertinoThemeData(
        primaryColor: Colors.white,
      ),
      home: new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          middle: Text("仿iOS风格的第三个界面"),  
          trailing: Icon(CupertinoIcons.add),//new CupertinoButton(child: Icon(CupertinoIcons.add),onPressed: rightAddAction),//右侧按钮
          leading: Icon(CupertinoIcons.back),
        ),
        child: new Center(
          child: CupertinoButton(
              child: Text(//按钮label
                naviTitle
              ),
              color: Colors.blue,//按钮颜色
              onPressed: buttonAction,
            ),
        ),
      ),
    );
  }

  // 尝试网络请求
  void httpRequest() async {
    Response response = await Dio().post("http://sun.topray-media.cn/tz_inf/api/topics");
    print(response);
  }

  void buttonAction() {
    print("按钮的点击事件");
  }

}
