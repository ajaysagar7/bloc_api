import 'package:bloc_api/data/models/usermodel/user_model.dart';
import 'package:bloc_api/network/repositories/user_repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  var userRepository = UserRepository();

  UsersBloc(this.userRepository) : super(UsersInitial()) {
    // on<UsersEvent>((event, emit) async {
    //   if (event is UsersLoadEvent) {

    //   }
    // });

    on<UsersLoadEvent>(((event, emit) async {
      emit(UsersLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        List<UserModel> userLists = await userRepository.getUsersLists();
        if (userLists.isNotEmpty) {
          emit(UsersLoaded(userLists: userLists));
        } else {
          emit(UsersError(erroMessage: "empty list called"));
        }
      } catch (e) {
        emit(UsersError(erroMessage: e.toString()));
      }
    }));
  }
}
