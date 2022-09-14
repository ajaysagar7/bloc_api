import 'dart:math';

import 'package:bloc_api/business_logic/users_bloc/users_bloc.dart';
import 'package:bloc_api/presentations/shimmers/users_shimer/users_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context.read<UsersBloc>().add(UsersLoadEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users Api Bloc"),
          centerTitle: true,
        ),
        body: BlocListener<UsersBloc, UsersState>(
          listener: ((context, state) {
            if (state is UsersError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.erroMessage.toString()),
                backgroundColor: Colors.red,
              ));
            }
            if (state is UsersLoaded) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("data loaded successfully"),
                backgroundColor: Colors.green,
              ));
            }
          }),
          child: BlocBuilder<UsersBloc, UsersState>(builder: ((context, state) {
            if (state is UsersLoading) {
              return const ShimmerUsers();
            } else if (state is UsersInitial) {
              return const Center(
                child: Text("Initial State of App"),
              );
            } else if (state is UsersLoaded) {
              return ListView.separated(
                itemCount: state.userLists.length,
                itemBuilder: (c, i) {
                  var userModel = state.userLists[i];
                  return Center(
                      child: ListTile(
                    trailing: CircleAvatar(
                        radius: 30,
                        child: Text(
                          userModel.name.substring(0, 2).toUpperCase(),
                        )),
                    title: Text(userModel.name.toString()),
                    subtitle: Text(userModel.email.toString()),
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: Text(userModel.id.toString())),
                  ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  // ignore: prefer_const_constructors
                  return Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: const Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  );
                },
              );
            } else {
              return Container();
            }
          })),
        ));
  }
}
