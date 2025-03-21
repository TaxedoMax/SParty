import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparty/features/users/application/user_service.dart';
import 'package:sparty/features/users/data/user_repository.dart';

import '../../../core/database/models/user.dart';

class UsersCubit extends Cubit<UsersState>{
  UsersCubit() : super(UsersState.initial());

  final UserService _service = UserService(UserRepository());

  Future<void> loadUsersFromContacts() async{
    emit(UsersState(isLoading: true, users: state.users));

    await _service.loadUsersFromContacts();
    var users = await _service.getAllUsers();

    emit(UsersState(isLoading: false, users: users));
  }

  Future<void> loadUsersList() async {
    emit(UsersState(isLoading: true, users: state.users));

    var users = await _service.getAllUsers();

    emit(UsersState(isLoading: false, users: users));
  }

}

class UsersState{
  UsersState({
    required this.isLoading,
    required this.users,
  });

  factory UsersState.initial() => UsersState(isLoading: false, users: []);

  final bool isLoading;
  final List<User> users;
}