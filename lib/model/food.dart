class Food {
  int _id;
  String _foodName;
  String _description;

  Food(this._foodName, this._description);

  Food.map(dynamic obj) {
    this._id = obj['id'];
    this._foodName = obj['foodName'];
    this._description = obj['description'];
  }

  int get id => _id;
  String get foodName => _foodName;
  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['foodName'] = _foodName;
    map['description'] = _description;

    return map;
  }

  Food.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._foodName = map['foodName'];
    this._description = map['description'];
  }
}