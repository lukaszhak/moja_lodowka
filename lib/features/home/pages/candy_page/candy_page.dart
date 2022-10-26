import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'package:moja_lodowka/domain/models/candy_document_model/candy_document_model.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/candy_add_page/candy_add_page.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CandyPage extends StatelessWidget {
  const CandyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        toolbarHeight: 50,
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.candys,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Column(
                    children:  [
                      Text(AppLocalizations.of(context)!.description),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 13,
                            height: 13,
                            decoration:
                                const BoxDecoration(color: Colors.black),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                           Text(AppLocalizations.of(context)!.productOutDate)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 13,
                            height: 13,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 0, 0)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                           Text(AppLocalizations.of(context)!.weekToOutDate)
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CandyAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/candy.jpg',
            ),
          ),
        ),
        child: BlocProvider(
          create: (context) =>
              getIt<CandyPageCubit>()..start(),
          child: BlocBuilder<CandyPageCubit, CandyPageState>(
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
                        AppLocalizations.of(context)!.noProducts,
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
                                .read<CandyPageCubit>()
                                .delete(document: documentModel.id)
                                .whenComplete(
                                  () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                     SnackBar(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 51, 54),
                                      content: Text(AppLocalizations.of(context)!.deleteInfo),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  ),
                                );
                          },
                          child: _CandyPageItem(
                            documentModel: documentModel,
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

class _CandyPageItem extends StatelessWidget {
  const _CandyPageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final CandyDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    if (documentModel.daysToExpire() <= documentModel.outDated()) {
      return _ItemContainer(documentModel: documentModel, color: Colors.black);
    }
    if (documentModel.daysToExpire() <= documentModel.closeCall()) {
      return _ItemContainer(
        documentModel: documentModel,
        color: const Color.fromARGB(255, 255, 0, 0),
      );
    }
    return _ItemContainer(
      documentModel: documentModel,
      color: const Color.fromARGB(255, 0, 51, 54),
    );
  }
}

class _ItemContainer extends StatelessWidget {
  const _ItemContainer({
    Key? key,
    required this.documentModel,
    required this.color,
  }) : super(key: key);

  final CandyDocumentModel documentModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          documentModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
             Text(
              AppLocalizations.of(context)!.expDate,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              documentModel.expDateFormated(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        )
      ]),
    );
  }
}
