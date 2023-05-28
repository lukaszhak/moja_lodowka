import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:moja_lodowka/data/remote_data_sources/candy_remote_data_source/candy_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/candy_documents_repository/candy_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CandyAddPage extends StatefulWidget {
  CandyAddPage({Key? key}) : super(key: key);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  State<CandyAddPage> createState() => _CandyAddPageState();
}

class _CandyAddPageState extends State<CandyAddPage> {
  String? _title;
  DateTime? _expDate;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CandyPageCubit(CandyDocumentsRepository(CandyRemoteDataSource())),
      child: BlocBuilder<CandyPageCubit, CandyPageState>(
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
                              .read<CandyPageCubit>()
                              .addDoc(_title!, _expDate!, notificationId);
                          context.read<CandyPageCubit>().scheduleNotification(
                              _expDate!, context, _title, notificationId);
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
                              primary: Color.fromARGB(255, 0, 51, 54))),
                      child: child!);
                });
            onDateChanged(selectedDate);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 51, 54)),
          child: Text(
              selectedDateFormated ?? AppLocalizations.of(context)!.selectDate),
        ),
      ],
    );
  }
}
