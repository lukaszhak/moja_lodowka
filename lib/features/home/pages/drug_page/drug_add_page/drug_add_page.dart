import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrugAddPage extends StatefulWidget {
  const DrugAddPage({Key? key}) : super(key: key);

  @override
  State<DrugAddPage> createState() => _DrugAddPageState();
}

class _DrugAddPageState extends State<DrugAddPage> {
  String? _title;
  DateTime? _expDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrugPageCubit>(),
      child: BlocBuilder<DrugPageCubit, DrugPageState>(
        builder: (context, state) {
          final notificationId = context.read<int>();
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.addMedication),
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              actions: [
                IconButton(
                  onPressed: _title == null || _expDate == null
                      ? null
                      : () {
                          context
                              .read<DrugPageCubit>()
                              .addDoc(_title!, _expDate!, notificationId);
                          context.read<DrugPageCubit>().scheduleNotification(
                              _expDate!, context, _title!, notificationId);
                          AppRouter().goBack();
                        },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: _DrugPageBody(
              onDateChanged: (newValue) {
                setState(() {
                  _expDate = newValue;
                });
              },
              onTitleChanged: (newValue) {
                setState(() {
                  _title = newValue;
                });
              },
              selectedDateFormated:
                  _expDate == null ? null : DateFormat.yM().format(_expDate!),
            ),
          );
        },
      ),
    );
  }
}

class _DrugPageBody extends StatelessWidget {
  const _DrugPageBody({
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
              label: Text(AppLocalizations.of(context)!.medicationName),
              border: const OutlineInputBorder(),
              hintText: AppLocalizations.of(context)!.typeMedication),
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
                      )),
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
