import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/cubit/drug_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/data_source/drug_remote_data_source.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/drug_add_page/drug_add_page.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/model/drug_document_model.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/repository/drug_documents_repository.dart';

class DrugPage extends StatelessWidget {
  const DrugPage({
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
          'Leki',
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
                          const Text('Lek przeterminowany')
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
                          const Text('30 dni do końca daty ważności')
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
              MaterialPageRoute(builder: (context) => const DrugAddPage()));
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
              'images/medicine.jpg',
            ),
          ),
        ),
        child: BlocProvider(
          create: (context) =>
              DrugPageCubit(DrugDocumentsRepository(DrugRemoteDataSource()))
                ..start(),
          child: BlocBuilder<DrugPageCubit, DrugPageState>(
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
                          'Trwa ładowanie',
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
                        'Brak leków do wyświetlenia',
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
                                  .read<DrugPageCubit>()
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
                            child: _DrugPageItem(
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

class _DrugPageItem extends StatelessWidget {
  const _DrugPageItem({
    required this.documentModel,
    Key? key,
  }) : super(key: key);

  final DrugDocumentModel documentModel;

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

  final DrugDocumentModel documentModel;
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
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
          ),
          Column(
            children: [
              const Text(
                'Termin Ważności',
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
