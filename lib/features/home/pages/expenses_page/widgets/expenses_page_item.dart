import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/domain/models/expenses_document_model/expenses_document_model.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';

class ExpensesPageItem extends StatelessWidget {
  const ExpensesPageItem({
    super.key,
    required this.documentModel,
  });

  final ExpensesDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                documentModel.category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                documentModel.title,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '${documentModel.amount.toString()} zł',
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                documentModel.expensesDateFormated(),
              )
            ],
          ),
          IconButton(
            onPressed: () {
              context
                  .read<ExpensesPageCubit>()
                  .deleteDoc(document: documentModel.id);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}