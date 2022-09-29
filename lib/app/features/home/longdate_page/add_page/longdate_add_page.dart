import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/cubit/longdate_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/repository/longdate_documents_repository.dart';

class LongDateAddPage extends StatefulWidget {
  const LongDateAddPage({Key? key}) : super(key: key);

  @override
  State<LongDateAddPage> createState() => _LongDateAddPageState();
}

class _LongDateAddPageState extends State<LongDateAddPage> {
  String? _title;
  DateTime? _expDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LongdatePageCubit(LongDateDocumentsRepository()),
      child: BlocBuilder<LongdatePageCubit, LongdatePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dodaj Produkt'),
              backgroundColor: const Color.fromARGB(255, 126, 68, 1),
              actions: [
                IconButton(
                  onPressed: _title == null || _expDate == null
                      ? null
                      : () {
                          context
                              .read<LongdatePageCubit>()
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
              hintText: 'Wpisz nazwę produktu'),
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
                          primary: Color.fromARGB(255, 126, 68, 1)),
                    ),
                    child: child!,
                  );
                });
            onDateChanged(selectedDate);
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 126, 68, 1),
          ),
          child: Text(selectedDateFormated ?? 'Wybierz datę ważności'),
        )
      ],
    );
  }
}
