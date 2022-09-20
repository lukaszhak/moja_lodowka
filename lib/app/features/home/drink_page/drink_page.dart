import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/drink_page/add_page/drink_add_page.dart';
import 'package:moja_lodowka/app/features/home/drink_page/cubit/drink_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/drink_page/model/drink_document_model.dart';
import 'package:moja_lodowka/app/features/home/drink_page/repository/drink_documents_repository.dart';

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
        backgroundColor: const Color.fromARGB(255, 245, 112, 3),
        title: const Text(
          'Napoje',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 245, 112, 3),
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
              DrinkPageCubit(DrinkDocumentsRepository())..start(),
          child: BlocBuilder<DrinkPageCubit, DrinkPageState>(
            builder: (context, state) {
              final documentModels = state.documents;

              return ListView(
                children: [
                  const SizedBox(height: 10),
                  for (final documentModel in documentModels) ...[
                    Dismissible(
                        key: ValueKey(documentModel.id),
                        onDismissed: (_) {
                          context
                              .read<DrinkPageCubit>()
                              .delete(document: documentModel.id);
                        },
                        child: _DrinkPageItem(
                          documentModel: documentModel,
                        )),
                  ],
                ],
              );
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
    return Container(
      color: const Color.fromARGB(255, 245, 112, 3),
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
