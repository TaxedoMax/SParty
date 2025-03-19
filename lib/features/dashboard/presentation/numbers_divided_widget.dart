import 'package:flutter/material.dart';

class NumbersDividedWidget extends StatelessWidget{
  const NumbersDividedWidget({
    super.key,
    required this.firstNumber,
    required this.secondNumber,
    required this.firstTitle,
    required this.secondTitle
  });

  final int firstNumber;
  final int secondNumber;

  final String firstTitle;
  final String secondTitle;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
          Expanded(
            child: Column(
              children: [
                Text(
                    firstNumber.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                    firstTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
      
          const VerticalDivider(),
      
          Expanded(
            child: Column(
              children: [
                Text(
                    secondNumber.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                    secondTitle,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}