import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';

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
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("第三个界面"),
        ),
        body: new Center(
          child: new Text(naviTitle),
        ),
      ),
    );
  }

  // 尝试网络请求
  void httpRequest() async {
  try {
    Response response = await Dio().post("http://sun.topray-media.cn/tz_inf/api/topics");
    print(response);
  } catch (error) {
    print(error);
  }
}

}
