import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpensesPageFloatingButton extends StatelessWidget {
  const ExpensesPageFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt<ExpensesPageCubit>(),
              child: BlocBuilder<ExpensesPageCubit, ExpensesPageState>(
                builder: (context, state) {
                  return AlertDialog(
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          AppRouter().goBack();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 51, 54),
                        ),
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                      ElevatedButton(
                        onPressed: state.expensesDate == null || state.title == null || state.category == null || state.amount == null ? null :() {
                          context.read<ExpensesPageCubit>().addDoc(
                              state.category!,
                              state.title!,
                              num.parse(state.amount!),
                              state.expensesDate!);
                          AppRouter().goBack();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 51, 54),
                        ),
                        child: Text(AppLocalizations.of(context)!.add),
                      )
                    ],
                    title: AlertDialogTitle(
                      onDateChanged: (newValue) {
                        context
                            .read<ExpensesPageCubit>()
                            .onDateChanged(expensesDate: newValue);
                      },
                    ),
                    content: AlertDialogContent(
                      onCategoryChanged: (newValue) {
                        context
                            .read<ExpensesPageCubit>()
                            .onCategoryChanged(category: newValue);
                      },
                      onTitleChanged: (newValue) {
                        context
                            .read<ExpensesPageCubit>()
                            .onTitleChanged(title: newValue);
                      },
                      onAmountChanged: (newValue) {
                        context
                            .read<ExpensesPageCubit>()
                            .onAmountChanged(amount: newValue);
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      backgroundColor: const Color.fromARGB(255, 0, 51, 54),
      child: const Icon(Icons.add),
    );
  }
}

class AlertDialogTitle extends StatelessWidget {
  const AlertDialogTitle({
    super.key,
    required this.onDateChanged,
  });

  final Function(DateTime?) onDateChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppLocalizations.of(context)!.addExpense),
        const SizedBox(
          width: 40,
        ),
        IconButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365 * 10),
                ),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                        primary: Color.fromARGB(255, 0, 51, 54),
                      )),
                      child: child!);
                });
            onDateChanged(selectedDate);
          },
          icon: const Icon(
            Icons.calendar_month,
          ),
        ),
      ],
    );
  }
}

class AlertDialogContent extends StatelessWidget {
  const AlertDialogContent({
    super.key,
    required this.onCategoryChanged,
    required this.onTitleChanged,
    required this.onAmountChanged,
  });

  final Function(String) onCategoryChanged;
  final Function(String) onTitleChanged;
  final Function(String) onAmountChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          onChanged: onCategoryChanged,
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.expenseCategory),
        ),
        TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: onTitleChanged,
          decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.expenseType),
        ),
        TextField(
          onChanged: onAmountChanged,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
          ],
          decoration:
              InputDecoration(hintText: AppLocalizations.of(context)!.amount),
        ),
      ],
    );
  }
}
