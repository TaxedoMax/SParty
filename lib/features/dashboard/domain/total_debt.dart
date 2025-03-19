import 'package:flutter/cupertino.dart';

enum DebtType{
  iOwe,
  oweMe,
  noDebt,
}

@immutable
class TotalDebt{
  const TotalDebt({
    required this.phoneNum,
    required this.debtType,
    required this.sum,
    this.name,
  });

  final String phoneNum;
  final String? name;

  final DebtType debtType;

  final double sum;
}