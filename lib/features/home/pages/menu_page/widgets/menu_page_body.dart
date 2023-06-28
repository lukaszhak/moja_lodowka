import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/app_router/app_router.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/noteview_page/viewnote_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPageBody extends StatelessWidget {
  const MenuPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          fit: BoxFit.cover,
          image: AssetImage(
            'images/menu.jpg',
          ),
        ),
      ),
      child: BlocProvider(
        create: (context) => getIt<MenuPageCubit>()..start(),
        child: BlocBuilder<MenuPageCubit, MenuPageState>(
          builder: (context, state) {
            final documentModels = state.documents;
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial State'),
                );
              case Status.loading:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Color.fromARGB(255, 0, 37, 2),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        AppLocalizations.of(context)!.loading,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              case Status.success:
                if (state.documents.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context)!.noRecipes,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  );
                }
                return ListView(
                  children: [
                    const SizedBox(height: 10),
                    for (final documentModel in documentModels) ...[
                      Dismissible(
                        key: ValueKey(documentModel.id),
                        onDismissed: (_) => context
                            .read<MenuPageCubit>()
                            .deleteDoc(document: documentModel.id)
                            .whenComplete(
                              () => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 51, 54),
                                  content: Text(
                                      AppLocalizations.of(context)!.deleteInfo),
                                  duration: const Duration(seconds: 1),
                                ),
                              ),
                            ),
                        child: InkWell(
                          onTap: () {
                            AppRouter().navigateToPage(
                              ViewNote(documentModel: documentModel),
                            );
                          },
                          child: _MenuPageListElement(
                            documentModel.title,
                            const Color.fromARGB(255, 0, 51, 54),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _MenuPageListElement extends StatelessWidget {
  const _MenuPageListElement(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(15),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
