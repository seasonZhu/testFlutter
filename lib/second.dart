import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SecondViewController extends StatelessWidget {
  static const platform =
      const MethodChannel('samples.flutter.io/pushToASwiftViewController');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个界面'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: swiftPush),
        ],
      ),
      body: Second(),
    );
  }

  Future<void> swiftPush() async {
    print("我想在这个界面搞事情");
    try {
      final int result = await platform.invokeMethod('swiftPush');
    } on PlatformException catch (e) {}
  }
}

class Second extends StatefulWidget {
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
                new Icon(
                  Icons.star,
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

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Second> {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
