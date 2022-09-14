part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  late List<UserModel> userLists = [];
  UsersLoaded({
    required this.userLists,
  });

  @override
  List<Object> get props => [userLists];
}

class UsersError extends UsersState {
  String erroMessage;
  UsersError({
    required this.erroMessage,
  });
  @override
  List<Object> get props => [erroMessage];
}
