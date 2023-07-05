import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPageButton extends StatelessWidget {
  const MenuPageButton({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 0, 51, 54),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => BlocProvider(
            create: (context) => getIt<MenuPageCubit>(),
            child: BlocBuilder<MenuPageCubit, MenuPageState>(
              builder: (context, state) {
                return AlertDialog(
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        AppRouter().goBack();
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<MenuPageCubit>()
                            .addDoc(title: controller.text, content: '');
                        controller.clear();
                        AppRouter().goBack();
                      },
                      child: Text(AppLocalizations.of(context)!.add),
                    ),
                  ],
                  title: Text(AppLocalizations.of(context)!.addRecipe),
                  content: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.typeInfo),
                  ),
                );
              },
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
