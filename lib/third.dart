import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ThirdViewController extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
            appBar: new AppBar(
              title: new Text("从Swift跳转到Flutter页面"),
            ),
            body: Third(),
          );
  }
}

class Third extends StatelessWidget {
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
                    '尝试从Swift跳转过来',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  '值传递和值回调还不会',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                new Icon(Icons.screen_share,
                    color: Colors.red[500],
                ),
          new Text('SwiftToFlutter'),
              ],
            ),
          ),
          
        ],
      ),
    );
  return titleSection;
  }
}