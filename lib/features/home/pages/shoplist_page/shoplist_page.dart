import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/features/home/home_page.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopListPage extends StatelessWidget {
  ShopListPage({
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
        title: Text(
          AppLocalizations.of(context)!.shoppingList,
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
                            context
                                .read<ShopListPageCubit>()
                                .add(title: controller.text);
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
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.6,
            fit: BoxFit.cover,
            image: AssetImage('images/zakupy.jpg'),
          ),
        ),
        child: BlocProvider(
          create: (context) => getIt<ShopListPageCubit>()..start(),
          child: BlocBuilder<ShopListPageCubit, ShopListPageState>(
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
                        AppLocalizations.of(context)!.emptyShopList,
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
                          onDismissed: (_) {
                            context
                                .read<ShopListPageCubit>()
                                .delete(document: documentModel.id)
                                .whenComplete(
                                  () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 51, 54),
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .deleteInfo),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  ),
                                );
                          },
                          child: CategoryWidget(
                            documentModel.title,
                            const Color.fromARGB(255, 0, 51, 54),
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
      ),
    );
  }
}
