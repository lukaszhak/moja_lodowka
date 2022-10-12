import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/pages/longdate_page/add_page/longdate_add_page.dart';
import 'package:moja_lodowka/app/features/home/pages/longdate_page/cubit/longdate_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/pages/longdate_page/model/longdate_document_model.dart';
import 'package:moja_lodowka/app/features/home/pages/longdate_page/repository/longdate_documents_repository.dart';

class LongdatePage extends StatelessWidget {
  const LongdatePage({
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
          'Produkty długoterminowe',
          style: TextStyle(
            fontSize: 21,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 13,
                                  height: 13,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 148, 0, 0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text('3 dni do końca daty ważności')
                              ],
                            ),
                          ],
                        ),
                      ));
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 51, 54),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LongDateAddPage()));
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
              'images/rice.jpg',
            ),
          ),
        ),
        child: BlocProvider(
          create: (context) =>
              LongdatePageCubit(LongDateDocumentsRepository())..start(),
          child: BlocBuilder<LongdatePageCubit, LongdatePageState>(
            builder: (context, state) {
              final documentModels = state.documents;
              switch (state.status) {
                case Status.initial:
                  return const Center(
                    child: Text('Initial Status'),
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
                          'Ładowanie dokumentów',
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
                                  .read<LongdatePageCubit>()
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
                            child: _LongDatePageItem(
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

class _LongDatePageItem extends StatelessWidget {
  const _LongDatePageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final LongDateDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    if (documentModel.daysLeft() == documentModel.closeCall()) {
      return _ItemContainer(
        documentModel: documentModel,
        color: const Color.fromARGB(255, 255, 0, 0),
      );
    }
    if (documentModel.daysLeft() == documentModel.nearlyOutDate()) {
      return _ItemContainer(
        documentModel: documentModel,
        color: const Color.fromARGB(255, 148, 0, 0),
      );
    }
    if (documentModel.daysLeft() == documentModel.outDated()) {
      return _ItemContainer(documentModel: documentModel, color: Colors.black);
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
    required this.color
  }) : super(key: key);

  final LongDateDocumentModel documentModel;
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
                  fontWeight: FontWeight.bold),
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
        ));
  }
}
