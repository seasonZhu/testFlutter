import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';

class SecondViewController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
            appBar: new AppBar(
              title: new Text('第二个界面'),
              actions: <Widget>[
              new IconButton(icon: new Icon(Icons.list), onPressed: swiftPush),
                ],
            ),
            //body: new ListView(children: divided),
            // 这个地方没有用ListView 使用的是我自己写的second.part中的文件
            body: Second(),
          );
  }

  void swiftPush() {
    print("这里我想尝试原生的push页面");
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                new Icon(Icons.star,
                    color: Colors.red[500],
                ),
          new Text('41'),
              ],
            ),
          ),
          
        ],
      ),
    );
  return titleSection;
  }
}