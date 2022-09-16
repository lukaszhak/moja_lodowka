import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/add_page/add_page.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/cubit/fridge_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/model/fridge_document_model.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/repository/fridge_documents_repository.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 28, 245),
        title: const Text(
          'Produkty Lodówkowe',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 3, 28, 245),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddPage()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: AssetImage('images/frozen.jpg'),
          ),
        ),
        child: BlocProvider(
          create: (context) => FridgePageCubit(FridgeDocumentsRepository())..start(),
          child: BlocBuilder<FridgePageCubit, FridgePageState>(
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
                              .read<FridgePageCubit>()
                              .delete(document: documentModel.id);
                        },
                        child: _FridgePageItem(documentModel: documentModel)),
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

class _FridgePageItem extends StatelessWidget {
  const _FridgePageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final FridgeDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 3, 28, 245),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
