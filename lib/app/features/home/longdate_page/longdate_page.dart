import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/add_page/longdate_add_page.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/cubit/longdate_page_cubit.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/model/longdate_document_model.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/repository/longdate_documents_repository.dart';

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
        backgroundColor: const Color.fromARGB(255, 126, 68, 1),
        title: const Text(
          'Produkty długoterminowe',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 126, 68, 1),
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

              return ListView(
                children: [
                  const SizedBox(height: 10),
                  for (final documentModel in documentModels) ...[
                    Dismissible(
                        key: ValueKey(documentModel.id),
                        onDismissed: (_) {
                          context
                              .read<LongdatePageCubit>()
                              .delete(document: documentModel.id);
                        },
                        child: _LongDatePageItem(
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

class _LongDatePageItem extends StatelessWidget {
  const _LongDatePageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final LongDateDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 126, 68, 1),
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
