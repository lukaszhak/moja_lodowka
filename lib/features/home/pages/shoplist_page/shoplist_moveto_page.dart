import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopListMoveToPage extends StatefulWidget {
  const ShopListMoveToPage({super.key, required this.documentModel});

  final ShopListDocumentModel documentModel;

  @override
  State<ShopListMoveToPage> createState() => _ShopListMoveToPageState();
}

class _ShopListMoveToPageState extends State<ShopListMoveToPage> {
  DateTime? _expDate;
  int notificationId = UniqueKey().hashCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.moveToCategory,
          style: const TextStyle(fontSize: 17.4),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<ShopListPageCubit>(),
        child: BlocBuilder<ShopListPageCubit, ShopListPageState>(
          builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.cover,
                image: AssetImage(
                  'images/openfridge.jpg',
                ),
              )),
              child: Column(
                children: [
                  MoveToPageElement(
                    title: AppLocalizations.of(context)!.medications,
                    onDateChanged: (newValue) {
                      setState(() {
                        _expDate = newValue;
                      });
                    },
                    onPressed: () {
                      context.read<ShopListPageCubit>().moveItemToDrugPage(
                          widget.documentModel.title,
                          _expDate!,
                          widget.documentModel.id,
                          notificationId,
                          context);
                      AppRouter().goBack();
                      AppRouter().goBack();
                    },
                  ),
                  MoveToPageElement(
                    title: AppLocalizations.of(context)!.drinks,
                    onDateChanged: (newValue) {
                      setState(() {
                        _expDate = newValue;
                      });
                    },
                    onPressed: () {
                      context.read<ShopListPageCubit>().moveItemToDrinkPage(
                          widget.documentModel.title,
                          _expDate!,
                          widget.documentModel.id,
                          notificationId,
                          context);
                      AppRouter().goBack();
                      AppRouter().goBack();
                    },
                  ),
                  MoveToPageElement(
                    title: AppLocalizations.of(context)!.longTerm,
                    onDateChanged: (newValue) {
                      setState(() {
                        _expDate = newValue;
                      });
                    },
                    onPressed: () {
                      context.read<ShopListPageCubit>().moveItemToLongDatePage(
                          widget.documentModel.title,
                          _expDate!,
                          widget.documentModel.id,
                          notificationId,
                          context);
                      AppRouter().goBack();
                      AppRouter().goBack();
                    },
                  ),
                  MoveToPageElement(
                    title: AppLocalizations.of(context)!.fridge,
                    onDateChanged: (newValue) {
                      setState(() {
                        _expDate = newValue;
                      });
                    },
                    onPressed: () {
                      context.read<ShopListPageCubit>().moveItemToFridgePage(
                          widget.documentModel.title,
                          _expDate!,
                          widget.documentModel.id,
                          notificationId,
                          context);
                      AppRouter().goBack();
                      AppRouter().goBack();
                    },
                  ),
                  MoveToPageElement(
                    title: AppLocalizations.of(context)!.candys,
                    onDateChanged: (newValue) {
                      setState(() {
                        _expDate = newValue;
                      });
                    },
                    onPressed: () {
                      context.read<ShopListPageCubit>().moveItemToCandyPage(
                          widget.documentModel.title,
                          _expDate!,
                          widget.documentModel.id,
                          notificationId,
                          context);
                      AppRouter().goBack();
                      AppRouter().goBack();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MoveToPageElement extends StatelessWidget {
  const MoveToPageElement({
    super.key,
    required this.onDateChanged,
    required this.onPressed,
    required this.title,
  });

  final Function(DateTime?) onDateChanged;
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          AppRouter().goBack();
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                      ElevatedButton(
                        onPressed: onPressed,
                        child: Text(AppLocalizations.of(context)!.move),
                      ),
                    ],
                    content: ElevatedButton(
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
                      child: Text(AppLocalizations.of(context)!.selectDate),
                    ),
                  ));
        },
        child: Container(
          color: const Color.fromARGB(255, 0, 51, 54),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
