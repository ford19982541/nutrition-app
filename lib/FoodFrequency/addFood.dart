import 'package:flutter/material.dart';
import 'package:nutrition_app/model/food.dart';
import 'package:nutrition_app/util/database_helper.dart';

class AddScreen extends StatefulWidget {
  final Food food;
  AddScreen(this.food);

  @override
  State<StatefulWidget> createState() => new _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _nameController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.food.foodName);
    _descriptionController = new TextEditingController(text: widget.food.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.food.id != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.food.id != null) {
                  db.updateNote(Food.fromMap({
                    'id': widget.food.id,
                    'foodName': _nameController.text,
                    'description': _descriptionController.text
                  })).then((_) {
                    Navigator.pop(context, 'update');
                  });
                }else {
                  db.saveNote(Food(_nameController.text, _descriptionController.text)).then((_) {
                    Navigator.pop(context, 'save');
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}