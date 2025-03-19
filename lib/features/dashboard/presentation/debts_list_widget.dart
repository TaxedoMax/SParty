import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparty/features/dashboard/application/toggle_button_cubit.dart';

class DebtsListWidget extends StatelessWidget{
  const DebtsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
        builder: (context, toggleButtonState) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ToggleButtons(
                  isSelected: toggleButtonState.isSelected,
                  onPressed: (index) => BlocProvider
                      .of<ToggleButtonCubit>(context).changeMode(index),
                  borderRadius: BorderRadius.circular(15.0),
                  children: const [
                    SizedBox(
                        width: 100,
                        child: Center(child: Text('Должны вы'))
                    ),
                    SizedBox(
                        width: 100,
                        child: Center(child: Text('Должны вам'))
                    ),
                  ],
                ),

                const SizedBox(height: 30),

              ],
            )
    );
  }

}