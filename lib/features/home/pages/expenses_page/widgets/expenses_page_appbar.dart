import 'package:flutter/material.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpensesPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ExpensesPageAppBar({
    super.key,
    required this.state,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);
  final ExpensesPageState state;

  @override
  Widget build(BuildContext context) {
    if (state.documents.isEmpty) {
      return const AppBarBody(
        title: '0 zł',
      );
    }
    final sum = state.documents
        .map((model) => model.amount)
        .reduce((value, element) => value + element);
    return AppBarBody(title: '$sum zł');
  }
}

class AppBarBody extends StatelessWidget {
  const AppBarBody({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.myExpenses,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Center(
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.total,
                style: const TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
