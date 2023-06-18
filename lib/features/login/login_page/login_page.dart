import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/cubit/root_cubit.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/login/login_page/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RootCubit>(),
      child: Scaffold(
        body: LoginPageBody(),
      ),
    );
  }
}


