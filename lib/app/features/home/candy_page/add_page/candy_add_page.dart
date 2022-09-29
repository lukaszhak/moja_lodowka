import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/features/home/candy_page/cubit/candy_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/candy_page/repository/candy_documents_repository.dart';

class CandyAddPage extends StatefulWidget {
  const CandyAddPage({Key? key}) : super(key: key);

  @override
  State<CandyAddPage> createState() => _CandyAddPageState();
}

class _CandyAddPageState extends State<CandyAddPage> {
  String? _title;
  DateTime? _expDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CandyPageCubit(CandyDocumentsRepository()),
      child: BlocBuilder<CandyPageCubit, CandyPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dodaj Produkt'),
              backgroundColor: const Color.fromARGB(255, 245, 3, 3),
              actions: [
                IconButton(
                  onPressed: _title == null || _expDate == null
                      ? null
                      : () {
                          context
                              .read<CandyPageCubit>()
                              .add(_title!, _expDate!);
                          Navigator.of(context).pop();
                        },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: _AddPageBody(
              onTitleChanged: (newValue) {
                setState(() {
                  _title = newValue;
                });
              },
              onDateChanged: (newValue) {
                setState(() {
                  _expDate = newValue;
                });
              },
              selectedDateFormated: _expDate == null
                  ? null
                  : DateFormat.yMMMd().format(_expDate!),
            ),
          );
        },
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    required this.onDateChanged,
    required this.onTitleChanged,
    this.selectedDateFormated,
    Key? key,
  }) : super(key: key);

  final Function(String) onTitleChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormated;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      children: [
        TextField(
          onChanged: onTitleChanged,
          decoration: const InputDecoration(
            label: Text('Nazwa Produktu'),
            border: OutlineInputBorder(),
            hintText: 'Wpisz Nazwę Produktu',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 10),
                ),
                builder: (context, child) {
                  return Theme(
                      data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                              primary: Color.fromARGB(255, 245, 3, 3))),
                      child: child!);
                });
            onDateChanged(selectedDate);
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 245, 3, 3),
          ),
          child: Text(selectedDateFormated ?? 'Wybierz Datę Ważności'),
        ),
      ],
    );
  }
}
