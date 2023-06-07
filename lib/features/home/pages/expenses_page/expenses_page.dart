import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/data/remote_data_sources/expenses_remote_data_source/expenses_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/expenses_documents_repository/expenses_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_appbar.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_gridview.dart';

class ExpensesPage extends StatelessWidget {
  ExpensesPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesPageCubit(
          ExpensesDocumentsRepository(ExpensesRemoteDataSource()))
        ..start(),
      child: BlocBuilder<ExpensesPageCubit, ExpensesPageState>(
        builder: (context, state) {
          final documentModels = state.documents;

          return Scaffold(
            backgroundColor: Colors.grey,
            appBar: ExpensesPageAppBar(controller: controller),
            body: ExpensesGridView(
              documentModels: documentModels,
              state: state,
            ),
          );
        },
      ),
    );
  }
}

