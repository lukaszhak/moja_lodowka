import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/home_page.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/noteview_page/viewnote_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPage extends StatelessWidget {
  MenuPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title:  Text(
          AppLocalizations.of(context)!.recipes,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 51, 54),
                        ),
                        child:  Text(AppLocalizations.of(context)!.cancel),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<MenuPageCubit>()
                              .add(title: controller.text, content: '');
                          controller.clear();
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 51, 54),
                        ),
                        child:  Text(AppLocalizations.of(context)!.add),
                      ),
                    ],
                    title:  Text(AppLocalizations.of(context)!.addRecipe),
                    content: TextField(
                      controller: controller,
                      decoration:
                           InputDecoration(hintText: AppLocalizations.of(context)!.typeInfo),
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
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
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
          create: (context) =>
          getIt<MenuPageCubit>()..start(),
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
                      children:  [
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
                    return  Center(
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
                          .delete(document: documentModel.id).whenComplete(() => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                     SnackBar(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 51, 54),
                                      content: Text(AppLocalizations.of(context)!.deleteInfo),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  ),),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ViewNote(documentModel:documentModel),
                            ),
                          );
                        },
                        child: CategoryWidget(
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
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
              }

              
            },
          ),
        ),
      ),
    );
  }
}
