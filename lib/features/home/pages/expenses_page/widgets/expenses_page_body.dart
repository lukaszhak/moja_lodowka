import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/expenses_document_model/expenses_document_model.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpensesPageBody extends StatelessWidget {
  const ExpensesPageBody({
    super.key,
    required this.documentModels,
    required this.state,
  });

  final List<ExpensesDocumentModel> documentModels;
  final ExpensesPageState state;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case Status.initial:
        return const Center(
          child: Text('Initial State'),
        );
      case Status.loading:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 15,
              ),
              Text(
                AppLocalizations.of(context)!.loading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      case Status.success:
        if (state.documents.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noElements,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          );
        }
        return ListView(
          children: [
            for (final documentModel in documentModels) ...[
              ExpensesPageItem(documentModel: documentModel),
              const Divider(
                color: Colors.black,
              ),
            ],
          ],
        );

      case Status.error:
        return Center(
          child: Text(
            state.errorMessage!,
            style: TextStyle(
                color: Theme.of(context).colorScheme.error, fontSize: 20),
          ),
        );
    }
  }
}
