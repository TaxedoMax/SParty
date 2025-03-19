class User {
  final int? id;
  final String phoneNumber;
  final String? name;

  User({this.id, this.name, required this.phoneNumber});

  /// Преобразование объекта в Map для sqflite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'name': name,
    };
  }

  /// Создание объекта из Map, полученного из БД
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      phoneNumber: map['phone_number'],
      name: map['name'],
    );
  }
}
