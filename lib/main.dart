import 'package:bloc_api/business_logic/users_bloc/users_bloc.dart';
import 'package:bloc_api/network/repositories/user_repository/user_repository.dart';
import 'package:bloc_api/presentations/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (c) => UserRepository()),
      ],
      child: Builder(builder: (context) {
        return MultiBlocProvider(
          providers: [
            //* usermodel bloc
            BlocProvider(
                create: (c) =>
                    UsersBloc(RepositoryProvider.of<UserRepository>(context))
                      ..add(UsersLoadEvent())),
          ],
          child: MaterialApp(
            title: 'Bloc Api users',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomePage(),
          ),
        );
      }),
    );
  }
}
