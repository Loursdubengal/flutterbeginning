import 'package:flutter/material.dart';

class MainScreen extends State<MainScreenState> {
  List<String> _activities = ["Dormir", "Manger", "Vaisselles", "Coder", "Chiner", "Ranger"];
  Set<String> _savedActivities;

  MainScreen(Set<String> _savedActivities){
    this._savedActivities = _savedActivities;
  }

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    String _activityIdInput = "";
    return Scaffold(
        appBar: AppBar(
          title: Text('Activités de la journée'),
          actions: <Widget>[
            new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
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
                        onPressed:() => _addActivity(_activityIdInput, context),
                      )
                    ],
                  )
              ),
            ),
          ],
        )
    );
  }

  void _pushSaved() {
    Navigator.of(context).pushNamed('/dayActivitiesScreen');
  }

  void _addActivity(String activity, BuildContext context){
      setState((){
        _activities = List.from(_activities)
          ..add(activity);
      });
      Navigator.pop(context);
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0), /*margin on each side*/
        itemCount: _activities.length,
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(_activities[i]);
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

class MainScreenState extends StatefulWidget {
  Set<String> _savedActivities;

  MainScreenState(Set<String> _savedActivities){
    this._savedActivities = _savedActivities;
  }

  @override
  MainScreen createState() => new MainScreen(_savedActivities);
}