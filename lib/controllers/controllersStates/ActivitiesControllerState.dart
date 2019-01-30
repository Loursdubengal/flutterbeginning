import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/ActivitiesController.dart';

abstract class ActivitiesControllerState extends State<ActivitiesController> {

  ActivitiesControllerState(Set<String> savedActivities);

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