import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/ActivitiesController.dart';

abstract class ActivitiesControllerState extends State<ActivitiesController> {
  Set<String> _savedActivities;

  ActivitiesControllerState(Set<String> savedActivities){
    this._savedActivities = savedActivities;
  }

  @protected
  List<String> activities = ["dormir", "manger", "vaisselles", "coder", "chiner", "ranger"];


  @protected
  void addActivity(String activity, BuildContext context){
    setState((){
      activities = List.from(activities)
        ..add(activity.toLowerCase());
    });
    Navigator.pop(context);
  }

  @protected
  void pushSaved() {
    Navigator.of(context).pushNamed('/dayActivitiesScreen');
  }
}