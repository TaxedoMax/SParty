import 'package:flutter/material.dart';
import 'package:sparty/features/users/presentation/users_list_widget.dart';

class UsersListScreen extends StatelessWidget{
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('SParty'),
          centerTitle: true,
        ),
        body: const UsersListWidget(),
    );
  }

}