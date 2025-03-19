import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparty/features/dashboard/domain/total_debt.dart';

class TotalDebtCubit extends Cubit<TotalDebtState>{
  TotalDebtCubit() : super(const TotalDebtState(isLoading: true));

  List<TotalDebt>? _totalDebtList;

  /// Updates all information in cubit
  void updateDebtList(){
    // TODO: Update all info from db/api
  }

  /// Display last information.
  void showDebtList(DebtType debtType){
    if(_totalDebtList != null){

      emit(TotalDebtState(
        isLoading: false,
        list: _totalDebtList!.where((element) => element.debtType == debtType).toList()
      ));

    } else{
      emit(const TotalDebtState(isLoading: true));
      // TODO: update info about debts.
    }
  }
}

class TotalDebtState{
  const TotalDebtState({
    required this.isLoading,
    this.list = const [],
  });

  final bool isLoading;
  final List<TotalDebt> list;
}