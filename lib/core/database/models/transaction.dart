class Transaction {
  final int? id;
  final int senderId;
  final int receiverId;
  final double amount;
  final String date;
  final int? debtId; // Связь с долгом (необязательно)

  Transaction({
    this.id,
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.date,
    this.debtId,
  });

  /// Преобразование объекта в Map для sqflite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'amount': amount,
      'date': date,
      'debt_id': debtId,
    };
  }

  /// Создание объекта из Map, полученного из БД
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      senderId: map['sender_id'],
      receiverId: map['receiver_id'],
      amount: map['amount'],
      date: map['date'],
      debtId: map['debt_id'],
    );
  }
}
