import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/total_debt.dart';

class ToggleButtonCubit extends Cubit<ToggleButtonState>{
  ToggleButtonCubit() : super(ToggleButtonState(DebtType.iOwe));

  void changeMode(int index){
    emit(
        index == DebtType.iOwe.index
            ? ToggleButtonState(DebtType.iOwe)
            : ToggleButtonState(DebtType.oweMe)
    );
  }
}

class ToggleButtonState{
  ToggleButtonState(this.mode);

  DebtType mode;

  List<bool> get isSelected{
    return mode == DebtType.iOwe
        ? [true, false]
        : [false, true];
  }
}