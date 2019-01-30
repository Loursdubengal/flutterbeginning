import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/controllersStates/DayActivitiesControllerState.dart';

class DayActivitiesView extends DayActivitiesControllerState {
  Set<String> _savedActivities;

  DayActivitiesView(Set<String> savedActivities): super(savedActivities){
    this._savedActivities = savedActivities;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

    final Iterable<ListTile> tiles = _savedActivities.map(
          (String pair) {
        return new ListTile(
          title: new Text(
            pair,
            style: _biggerFont,
          ),
        );
      },
    );
    final List<Widget> divided = ListTile
        .divideTiles(
      context: context,
      tiles: tiles,
    )
        .toList();
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Activités choisies'),
      ),
      body: new ListView(children: divided),
    );
  }
}

