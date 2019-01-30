import 'package:flutter/material.dart';

import 'package:flutter_app/controllers/controllersStates/ActivitiesControllerState.dart';

class ActivitiesView extends ActivitiesControllerState {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  Set<String> _savedActivities;

  ActivitiesView(Set<String> savedActivities) : super(savedActivities){
    _savedActivities = savedActivities;
  }

  @override
  Widget build(BuildContext context) {
    String _activityIdInput = "";
    return Scaffold(
        appBar: AppBar(
          title: Text('Activités de la journée'),
          actions: <Widget>[
            new IconButton(icon: const Icon(Icons.list), onPressed: pushSaved),
          ],
        ),
        body: _buildSuggestions(),
        floatingActionButton:Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "addButton",
              child: Icon(Icons.add),
              onPressed: () => showDialog(
                  context: context,
                  child: new AlertDialog(
                    title: new Text('Ajouter une activité'),
                    content: new TextField(
                      decoration: new InputDecoration(
                          labelText: "Nom de l'activité"
                      ),
                      onChanged: (String text) {
                        _activityIdInput = text;
                      },
                    ),
                    actions:<Widget>[
                      FlatButton(
                        child: new Text("Cancel"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      FlatButton(
                        child: new Text("Add"),
                        onPressed:() => addActivity(_activityIdInput, context),
                      )
                    ],
                  )
              ),
            ),
          ],
        )
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0), /*margin on each side*/
        itemCount: activities.length,
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(activities[i]);
        });
  }

  Widget _buildRow(String pair) {
    final bool alreadySaved = _savedActivities.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedActivities.remove(pair);
          } else {
            _savedActivities.add(pair);
          }
        });
      },
    );
  }
}