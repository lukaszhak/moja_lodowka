import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/cubit/fridge_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/repository/fridge_documents_repository.dart';

class FridgeAddPage extends StatefulWidget {
  const FridgeAddPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FridgeAddPage> createState() => _FridgeAddPageState();
}

class _FridgeAddPageState extends State<FridgeAddPage> {
  String? _title;
  DateTime? _expDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FridgePageCubit(FridgeDocumentsRepository()),
      child: BlocBuilder<FridgePageCubit, FridgePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              title: const Text('Dodaj Produkt'),
              actions: [
                IconButton(
                  onPressed: _title == null || _expDate == null
                      ? null
                      : () {
                          context
                              .read<FridgePageCubit>()
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
    Key? key,
    required this.onDateChanged,
    required this.onTitleChanged,
    this.selectedDateFormated,
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
                          primary: Color.fromARGB(255, 0, 51, 54),
                        ),
                      ),
                      child: child!);
                });
            onDateChanged(selectedDate);
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 0, 51, 54),
          ),
          child: Text(selectedDateFormated ?? 'Wybierz Datę Ważności'),
        ),
      ],
    );
  }
}
