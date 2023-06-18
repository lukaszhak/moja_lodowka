import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_body.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_floating_button.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  DateTime? expensesDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExpensesPageCubit>()..start(),
      child: BlocBuilder<ExpensesPageCubit, ExpensesPageState>(
        builder: (context, state) {
          final documentModels = state.documents;

          return Scaffold(
            appBar: ExpensesPageAppBar(
              state: state,
            ),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.15,
                  image: AssetImage('images/dollar.jpg'),
                ),
              ),
              child: ExpensesPageBody(
                documentModels: documentModels,
                state: state,
              ),
            ),
            floatingActionButton: const ExpensesPageFloatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
