import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/drug_page/add_page/drug_add_page.dart';
import 'package:moja_lodowka/app/features/home/drug_page/cubit/drug_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/drug_page/model/drug_document_model.dart';
import 'package:moja_lodowka/app/features/home/drug_page/repository/drug_documents_repository.dart';

class DrugPage extends StatelessWidget {
  DrugPage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'Leki',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
              DrugPageCubit(DrugDocumentsRepository())..start(),
          child: BlocBuilder<DrugPageCubit, DrugPageState>(
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
                              .read<DrugPageCubit>()
                              .delete(document: documentModel.id);
                        },
                        child: _DrugPageItem(
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

class _DrugPageItem extends StatelessWidget {
  const _DrugPageItem({
    required this.documentModel,
    Key? key,
  }) : super(key: key);

  final DrugDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
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
