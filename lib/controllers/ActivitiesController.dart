import 'package:flutter/material.dart';

import 'package:flutter_app/views/ActivitiesView.dart';

class ActivitiesController extends StatefulWidget {
  Set<String> _savedActivities;

  ActivitiesController(Set<String> savedActivities){
    this._savedActivities = savedActivities;
  }

  @override
  ActivitiesView createState() => new ActivitiesView(_savedActivities);
}


