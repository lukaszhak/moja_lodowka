import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrugAddPage extends StatelessWidget {
  const DrugAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrugPageCubit>(),
      child: BlocBuilder<DrugPageCubit, DrugPageState>(
        builder: (context, state) {
          final notificationId = context.read<int>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.addMedication),
              actions: [
                IconButton(
                  onPressed: state.title == null || state.expDate == null
                      ? null
                      : () {
                          context.read<DrugPageCubit>().addDoc(
                              state.title!, state.expDate!, notificationId);
                          context.read<DrugPageCubit>().scheduleNotification(
                              state.expDate!,
                              context,
                              state.title,
                              notificationId);
                          AppRouter().goBack();
                        },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: _DrugPageBody(
              onDateChanged: (newValue) {
                context.read<DrugPageCubit>().onDateChanged(expDate: newValue);
              },
              onTitleChanged: (newValue) {
                context.read<DrugPageCubit>().onTitleChanged(title: newValue);
              },
              selectedDateFormated: state.expDate == null
                  ? null
                  : DateFormat.yM().format(state.expDate!),
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.25,
          fit: BoxFit.cover,
          image: AssetImage(
            'images/medicine.jpg',
          ),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          TextField(
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            onChanged: onTitleChanged,
            decoration: InputDecoration(
                label: Text(
                  AppLocalizations.of(context)!.medicationName,
                  style: const TextStyle(fontSize: 18),
                ),
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
                  ));
              onDateChanged(selectedDate);
            },
            child: Text(selectedDateFormated ??
                AppLocalizations.of(context)!.selectDate),
          ),
        ],
      ),
    );
  }
}
