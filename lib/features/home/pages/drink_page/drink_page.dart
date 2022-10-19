import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/drink_document_model/drink_document_model.dart';
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/drink_add_page/drink_add_page.dart';
class DrinkPage extends StatelessWidget {
  const DrinkPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        title: const Text(
          'Napoje',
          style: TextStyle(
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
                    children: const [
                      Text('Legenda'),
                      Divider(
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
                          const Text('Produkt przeterminowany')
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
                          const Text('7 dni do końca daty ważności')
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DrinkAddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/water.jpg',
            ),
          ),
        ),
        child: BlocProvider(
          create: (context) =>
              DrinkPageCubit(DrinkDocumentsRepository(DrinkRemoteDataSource()))
                ..start(),
          child: BlocBuilder<DrinkPageCubit, DrinkPageState>(
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
                      children: const [
                        CircularProgressIndicator(
                          color: Color.fromARGB(255, 0, 37, 2),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Ładowanie, proszę czekać',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                case Status.success:
                  if (state.documents.isEmpty) {
                    return const Center(
                      child: Text(
                        'Brak produktów do wyświetlenia',
                        style: TextStyle(
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
                                  .read<DrinkPageCubit>()
                                  .delete(document: documentModel.id)
                                  .whenComplete(
                                    () => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(255, 0, 51, 54),
                                        content: Text('Pomyślnie usunięto'),
                                        duration: Duration(seconds: 1),
                                      ),
                                    ),
                                  );
                            },
                            child: _DrinkPageItem(
                              documentModel: documentModel,
                            )),
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

class _DrinkPageItem extends StatelessWidget {
  const _DrinkPageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final DrinkDocumentModel documentModel;

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
  const _ItemContainer(
      {Key? key, required this.documentModel, required this.color})
      : super(key: key);

  final DrinkDocumentModel documentModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
              const Text(
                'Termin ważności',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                documentModel.expDateFormated(),
                style: const TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
