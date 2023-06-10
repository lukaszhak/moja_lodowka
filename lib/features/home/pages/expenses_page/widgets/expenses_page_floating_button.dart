import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';

class ExpensesPageFloatingButton extends StatefulWidget {
  const ExpensesPageFloatingButton({super.key});

  @override
  State<ExpensesPageFloatingButton> createState() =>
      _ExpensesPageFloatingButtonState();
}

class _ExpensesPageFloatingButtonState
    extends State<ExpensesPageFloatingButton> {
  DateTime? expensesDate;
  String? title;
  String? category;
  String? amount;
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
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 51, 54),
                        ),
                        child: const Text('Cofnij'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ExpensesPageCubit>().addDoc(category!,
                              title!, num.parse(amount!), expensesDate!);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 51, 54),
                        ),
                        child: const Text('Dodaj'),
                      )
                    ],
                    title: AlertDialogTitle(
                      onDateChanged: (newValue) {
                        setState(() {
                          expensesDate = newValue;
                        });
                      },
                    ),
                    content: AlertDialogContent(
                      onCategoryChanged: (newValue) {
                        setState(() {
                          category = newValue;
                        });
                      },
                      onTitleChanged: (newValue) {
                        setState(() {
                          title = newValue;
                        });
                      },
                      onAmountChanged: (newValue) {
                        setState(() {
                          amount = newValue;
                        });
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
        const Text('Dodaj Wydatek'),
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
          decoration: const InputDecoration(hintText: 'Kategoria'),
        ),
        TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: onTitleChanged,
          decoration: const InputDecoration(hintText: 'Rodzaj wydatku'),
        ),
        TextField(
          onChanged: onAmountChanged,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(hintText: 'Kwota'),
        ),
      ],
    );
  }
}
