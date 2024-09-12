class Car {
  final String name;
  final double consumption;
  String? id;

  Car({required this.name, required this.consumption, this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'consumption': consumption as double,
      'id': id != null? id! : '' ,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
        name: map['name'], consumption: map['consumption'] as double, id: map['id']);
  }
}
