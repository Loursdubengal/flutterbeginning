import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/ActivitiesController.dart';
import 'package:flutter_app/controllers/DayActivitiesController.dart';

class MainController extends StatelessWidget{
  @protected
  Set<String> savedActivities = new Set<String>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ActivitiesController(savedActivities),
      routes: <String, WidgetBuilder> {
        '/mainScreen' : (BuildContext context) => new ActivitiesController(savedActivities),
        '/dayActivitiesScreen' : (BuildContext context) => new DayActivitiesController(savedActivities)
      },
    );
  }
}