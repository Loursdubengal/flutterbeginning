import 'package:flutter/material.dart';

import 'package:flutter_app/views/DayActivitiesView.dart';

class DayActivitiesController extends StatefulWidget {
  Set<String> _savedActivities;

  DayActivitiesController(Set<String> _savedActivities) {
    this._savedActivities = _savedActivities;
  }

  @override
  DayActivitiesView createState() => new DayActivitiesView(_savedActivities);

}


