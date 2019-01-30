import 'package:flutter/material.dart';
import 'package:flutter_app/screens/MainScreen.dart';
import 'package:flutter_app/screens/DayActivitiesScreen.dart';

void main() => runApp(FlutterBeginnerApp());

class FlutterBeginnerApp extends StatelessWidget{
  Set<String> _savedActivities = new Set<String>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreenState(_savedActivities),
      routes: <String, WidgetBuilder> {
        '/mainScreen' : (BuildContext context) => new MainScreenState(_savedActivities),
        '/dayActivitiesScreen' : (BuildContext context) => new DayActivitiesScreen(_savedActivities)
      },
    );
  }
}