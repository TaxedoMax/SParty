import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparty/core/theme/theme.dart';
import 'package:sparty/features/dashboard/presentation/dashboard_screen.dart';
import 'package:sparty/features/users/application/users_cubit.dart';
import 'package:sparty/features/users/presentation/users_list_screen.dart';

void main() {
  runApp(const SPartyApp());
}

class SPartyApp extends StatelessWidget {
  const SPartyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SParty',
      theme: SPartyTheme.lightTheme,
      home: MultiBlocProvider(
          providers: [
            BlocProvider<UsersCubit>(
              create: (BuildContext context) => UsersCubit()..loadUsersFromContacts(),
            )
          ],
          child: const UsersListScreen()
      ),
    );
  }
}
