import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/DayActivitiesController.dart';

abstract class DayActivitiesControllerState extends State<DayActivitiesController> {

  DayActivitiesControllerState(Set<String> savedActivities);
}