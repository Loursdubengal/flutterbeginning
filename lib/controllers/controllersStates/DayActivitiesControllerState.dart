import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/DayActivitiesController.dart';

abstract class DayActivitiesControllerState extends State<DayActivitiesController> {
  Set<String> _savedActivities;

  DayActivitiesControllerState(Set<String> savedActivities){
    this._savedActivities = savedActivities;
  }
}