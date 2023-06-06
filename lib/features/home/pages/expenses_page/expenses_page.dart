import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/data/remote_data_sources/expenses_remote_data_source/expenses_remote_data_source.dart';
import 'package:moja_lodowka/domain/repositories/expenses_documents_repository/expenses_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  Offset _tapPosition = Offset.zero;

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesPageCubit(
          ExpensesDocumentsRepository(ExpensesRemoteDataSource()))
        ..start(),
      child: BlocBuilder<ExpensesPageCubit, ExpensesPageState>(
        builder: (context, state) {
          final documentModels = state.documents;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 0, 51, 54),
              title: const Text(
                'Moje wydatki',
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
                      builder: (context) {
                        return BlocProvider(
                          create: (context) => ExpensesPageCubit(
                            ExpensesDocumentsRepository(
                              ExpensesRemoteDataSource(),
                            ),
                          ),
                          child:
                              BlocBuilder<ExpensesPageCubit, ExpensesPageState>(
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
                                    child: const Text('Cofnij'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<ExpensesPageCubit>()
                                          .addDoc(controller.text);
                                      controller.clear();
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 0, 51, 54),
                                    ),
                                    child: const Text('Dodaj'),
                                  )
                                ],
                                title: const Text('Dodaj kategorię'),
                                content: TextField(
                                  autofocus: true,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: controller,
                                  decoration: const InputDecoration(
                                      hintText: 'Wpisz kategorię'),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            body: GridView.builder(
              itemCount: documentModels.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 175,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                final title = documentModels[index].title;
                final documentId = documentModels[index].id;

                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTapDown: (details) => _getTapPosition(details),
                    onLongPress: () {
                      showContextMenu(context, documentId);
                    },
                    child: ExpensesPageItem(
                      title: title,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void showContextMenu(BuildContext context, String documentId) async {
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();

    await showMenu(
        context: context,
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),
        items: [
          PopupMenuItem(
            onTap: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context
                    .read<ExpensesPageCubit>()
                    .deleteDoc(document: documentId);
              });
            },
            value: 'transposition',
            child: const Text('Usuń'),
          ),
        ]);
  }
}

class ExpensesPageItem extends StatelessWidget {
  const ExpensesPageItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 51, 54),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
