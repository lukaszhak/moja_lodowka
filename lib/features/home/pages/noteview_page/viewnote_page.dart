import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/noteedit_page/noteedit_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({
    required this.documentModel,
    Key? key,
  }) : super(key: key);

  final MenuDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MenuPageCubit>(),
      child: BlocBuilder<MenuPageCubit, MenuPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(documentModel.title),
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
            ),
            body: Builder(
              builder: (context) {
                if (state.currentIndex == 1) {
                  return EditNote(
                    documentModel: documentModel,
                    onSave: () {
                      context.read<MenuPageCubit>().newIndex(newIndex: 0);
                    },
                  );
                }
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(documentModel.content),
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.white,
              selectedItemColor: const Color.fromARGB(255, 30, 253, 1),
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              currentIndex: state.currentIndex,
              onTap: (newIndex) {
                context.read<MenuPageCubit>().newIndex(newIndex: newIndex);
              },
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.list,
                    ),
                    label: AppLocalizations.of(context)!.view),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.edit,
                    ),
                    label: AppLocalizations.of(context)!.edit),
              ],
            ),
          );
        },
      ),
    );
  }
}
