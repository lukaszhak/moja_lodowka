import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';

class DrinkAddPage extends StatefulWidget {
  const DrinkAddPage({Key? key}) : super(key: key);

  @override
  State<DrinkAddPage> createState() => _DrinkAddPageState();
}

class _DrinkAddPageState extends State<DrinkAddPage> {
  String? _title;
  DateTime? _expDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinkPageCubit(DrinkDocumentsRepository(DrinkRemoteDataSource())),
      child: BlocBuilder<DrinkPageCubit, DrinkPageState>(
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
                                .read<DrinkPageCubit>()
                                .add(_title!, _expDate!);
                            Navigator.of(context).pop();
                          },
                    icon: const Icon(Icons.check)),
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
              hintText: 'Wpisz Nazwę Produktu'),
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
                primary: const Color.fromARGB(255, 0, 51, 54)),
            child: Text(selectedDateFormated ?? 'Wybierz Datę Ważności'))
      ],
    );
  }
}
