import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrinkAddPage extends StatelessWidget {
  const DrinkAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrinkPageCubit>(),
      child: BlocBuilder<DrinkPageCubit, DrinkPageState>(
        builder: (context, state) {
          final notificationId = context.read<int>();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.addProduct),
              actions: [
                IconButton(
                    onPressed: state.title == null || state.expDate == null
                        ? null
                        : () {
                            context.read<DrinkPageCubit>().addDoc(
                                state.title!, state.expDate!, notificationId);
                            context.read<DrinkPageCubit>().scheduleNotification(
                                state.expDate!,
                                context,
                                state.title,
                                notificationId);
                            AppRouter().goBack();
                          },
                    icon: const Icon(Icons.check)),
              ],
            ),
            body: _AddPageBody(
              onTitleChanged: (newValue) {
                context.read<DrinkPageCubit>().onTitleChanged(title: newValue);
              },
              onDateChanged: (newValue) {
                context.read<DrinkPageCubit>().onDateChanged(expDate: newValue);
              },
              selectedDateFormated: state.expDate == null
                  ? null
                  : DateFormat('dd.MM.yyyy').format(state.expDate!),
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.25,
          fit: BoxFit.cover,
          image: AssetImage(
            'images/water.jpg',
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
                  AppLocalizations.of(context)!.productName,
                  style: const TextStyle(fontSize: 18),
                ),
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
              );
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
