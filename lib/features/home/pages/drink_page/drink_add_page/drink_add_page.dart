import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      create: (context) =>
          DrinkPageCubit(DrinkDocumentsRepository(DrinkRemoteDataSource())),
      child: BlocBuilder<DrinkPageCubit, DrinkPageState>(
        builder: (context, state) {
          final notificationId = context.read<int>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              title: Text(AppLocalizations.of(context)!.addProduct),
              actions: [
                IconButton(
                    onPressed: _title == null || _expDate == null
                        ? null
                        : () {
                            context
                                .read<DrinkPageCubit>()
                                .addDoc(_title!, _expDate!, notificationId);
                            context.read<DrinkPageCubit>().scheduleNotification(
                                _expDate!, context, _title, notificationId);
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
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          onChanged: onTitleChanged,
          decoration: InputDecoration(
              label: Text(AppLocalizations.of(context)!.productName),
              border: const OutlineInputBorder(),
              hintText: AppLocalizations.of(context)!.typeName),
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
                backgroundColor: const Color.fromARGB(255, 0, 51, 54)),
            child: Text(selectedDateFormated ??
                AppLocalizations.of(context)!.selectDate))
      ],
    );
  }
}
