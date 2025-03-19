import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparty/features/dashboard/application/toggle_button_cubit.dart';
import 'package:sparty/features/dashboard/application/total_debt_cubit.dart';
import 'package:sparty/features/dashboard/presentation/debts_list_widget.dart';
import 'package:sparty/features/dashboard/presentation/numbers_divided_widget.dart';

class DashboardScreen extends StatelessWidget{
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToggleButtonCubit>(
          create: (BuildContext context) => ToggleButtonCubit(),
        ),
        BlocProvider<TotalDebtCubit>(
          create: (BuildContext context) => TotalDebtCubit()
            ..updateDebtList()
            ..showDebtList(BlocProvider.of<ToggleButtonCubit>(context).state.mode),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('SParty'),
          centerTitle: true,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
            SizedBox(height: 15),
      
            NumbersDividedWidget(
                firstNumber: 150000,
                secondNumber: 150,
                firstTitle: 'Ваши долги',
                secondTitle: 'Долги вам'
            ),
      
            SizedBox(height: 30),

            DebtsListWidget(),
          ],
        ),
      ),
    );
  }

}