import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparty/features/users/application/users_cubit.dart';

import '../../../core/database/models/user.dart';

class UsersListWidget extends StatelessWidget{
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
        builder: (context, usersState){
          if(usersState.isLoading) return const CircularProgressIndicator();

          return ListView.builder(
              itemCount: usersState.users.length,
              itemBuilder: (context, index) =>
                  UserItem(user: usersState.users[index]),
          );
        }
    );
  }
}

class UserItem extends StatelessWidget{
  const UserItem({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name ?? "Безымянный",
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 4),

          Text(
            user.phoneNumber,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

}