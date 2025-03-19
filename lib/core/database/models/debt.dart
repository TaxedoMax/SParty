class Debt {
  final int? id;
  final int lenderId; // Тот, кому должны
  final int borrowerId; // Должник
  final double amount;
  final String description;
  final String date;

  Debt({
    this.id,
    required this.lenderId,
    required this.borrowerId,
    required this.amount,
    required this.description,
    required this.date,
  });

  /// Преобразование объекта в Map для sqflite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lender_id': lenderId,
      'borrower_id': borrowerId,
      'amount': amount,
      'description': description,
      'date': date,
    };
  }

  /// Создание объекта из Map, полученного из БД
  factory Debt.fromMap(Map<String, dynamic> map) {
    return Debt(
      id: map['id'],
      lenderId: map['lender_id'],
      borrowerId: map['borrower_id'],
      amount: map['amount'],
      description: map['description'],
      date: map['date'],
    );
  }
}
