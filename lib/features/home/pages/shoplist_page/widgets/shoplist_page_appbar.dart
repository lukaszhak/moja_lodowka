import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopListPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShopListPageAppBar({
    super.key,
    required this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => getIt<ShopListPageCubit>(),
                  child: BlocBuilder<ShopListPageCubit, ShopListPageState>(
                    builder: (context, state) {
                      return AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 51, 54),
                            ),
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<ShopListPageCubit>().add(
                                  title: controller.text, isChecked: false);
                              controller.clear();
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 51, 54),
                            ),
                            child: Text(AppLocalizations.of(context)!.add),
                          ),
                        ],
                        title: Text(AppLocalizations.of(context)!.addProduct),
                        content: TextField(
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                          controller: controller,
                          decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.typeInfo),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.add_shopping_cart),
          iconSize: 27,
        ),
      ],
      toolbarHeight: 50,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 0, 51, 54),
      title: Text(
        AppLocalizations.of(context)!.shoppingList,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
