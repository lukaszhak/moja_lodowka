import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/app/data_source/root_remote_data_source.dart';
import 'package:moja_lodowka/app/features/home/home_page.dart';
import 'package:moja_lodowka/app/features/login/login_page/login_page.dart';
import 'package:moja_lodowka/app/root_repository/root_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit(RootRepository(RootRemoteDataSource()))..start(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootPage(),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return LoginPage();
        }
        return HomePage(
          user: user,
        );
      },
    );
  }
}
