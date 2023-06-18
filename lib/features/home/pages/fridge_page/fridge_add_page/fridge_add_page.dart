import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/cubit/fridge_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      create: (context) => getIt<FridgePageCubit>(),
      child: BlocBuilder<FridgePageCubit, FridgePageState>(
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
                              .read<FridgePageCubit>()
                              .addDoc(_title!, _expDate!, notificationId);
                          context.read<FridgePageCubit>().scheduleNotification(
                              _expDate!, context, _title!, notificationId);
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
                  : DateFormat('dd.MM.yyyy').format(_expDate!),
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
          textCapitalization: TextCapitalization.sentences,
          autofocus: true,
          onChanged: onTitleChanged,
          decoration: InputDecoration(
            label: Text(AppLocalizations.of(context)!.productName),
            border: const OutlineInputBorder(),
            hintText: AppLocalizations.of(context)!.typeName,
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
            backgroundColor: const Color.fromARGB(255, 0, 51, 54),
          ),
          child: Text(
              selectedDateFormated ?? AppLocalizations.of(context)!.selectDate),
        ),
      ],
    );
  }
}
