import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Activités de la journée',
        home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  List<String> _activities = ["Dormir", "Manger", "Vaisselles", "Coder", "Chiner", "Ranger"];
  Set<String> _savedActivities = new Set<String>();
  TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  String _activityIdInput = "";
  @override
  Widget build(BuildContext context) {
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
                      onPressed:() => _addActivity(_activityIdInput),
                    )
                  ],
                )
              ),
            ),
          ],
      )
    );
  }
  
  void _addActivity(String activity){
    setState((){
      _activities = List.from(_activities)
      ..add(activity);
    });
    Navigator.pop(context);
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
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

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Activités choisies'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
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

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}