import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/candy_page/add_page/candy_add_page.dart';
import 'package:moja_lodowka/app/features/home/candy_page/cubit/candy_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/candy_page/model/candy_document_model.dart';
import 'package:moja_lodowka/app/features/home/candy_page/repository/candy_documents_repository.dart';

class CandyPage extends StatelessWidget {
  const CandyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 245, 3, 3),
        title: const Text(
          'Słodycze',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 250, 252, 250),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 245, 3, 3),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const CandyAddPage()));
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
              CandyPageCubit(CandyDocumentsRepository())..start(),
          child: BlocBuilder<CandyPageCubit, CandyPageState>(
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
                              .read<CandyPageCubit>()
                              .delete(document: documentModel.id);
                        },
                        child: _CandyPageItem(
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

class _CandyPageItem extends StatelessWidget {
  const _CandyPageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final CandyDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 245, 3, 3),
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
            ),
          ],
        )
      ]),
    );
  }
}
