import 'package:flutter/material.dart';
import 'package:nutrition_app/uidata.dart';
import 'package:nutrition_app/model/food.dart';
import 'package:nutrition_app/util/database_helper.dart';
import 'package:nutrition_app/FoodFrequency/addFood.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Food> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllNotes().then((notes) {
      setState(() {
        notes.forEach((food) {
          items.add(Food.fromMap(food));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UIData.appName),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              padding: const EdgeInsets.only(right: 15),
              icon: Icon(Icons.add), onPressed: () => _createNewFood(context)),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: items.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Divider(height: 1.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        '${items[position].foodName}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].description}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 15.0,
                        child: Text(
                          '${items[position].id}',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle),
                        iconSize: 30,
                        color: Colors.red,
                        onPressed: () =>
                            _deleteFood(context, items[position], position),
                      ),
                      onTap: () => _navigateToFood(context, items[position]),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  Widget _addBtn() => FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          _addFood();
        },
        child: Text(
          "Add",
          style: TextStyle(fontSize: 20.0),
        ),
      );

  void _addFood() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
//          return Container(
          return Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Card(
                    child: TextField(
//                    obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Food Name',
                  ),
                )),
              ],
            ),
          );
        });
  }

  void _deleteFood(BuildContext context, Food food, int position) async {
    db.deleteNote(food.id).then((notes) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToFood(BuildContext context, Food food) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddScreen(food)),
    );

    if (result == 'update') {
      db.getAllNotes().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Food.fromMap(note));
          });
        });
      });
    }
  }

  void _createNewFood(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddScreen(Food('', ''))),
    );

    if (result == 'save') {
      db.getAllNotes().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Food.fromMap(note));
          });
        });
      });
    }
  }
}
