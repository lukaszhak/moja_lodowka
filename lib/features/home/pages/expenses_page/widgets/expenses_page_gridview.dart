import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/expenses_document_model/expenses_document_model.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/widgets/expenses_page_item.dart';


class ExpensesGridView extends StatefulWidget {
  const ExpensesGridView({
    super.key,
    required this.documentModels,
    required this.state,
  });

  final List<ExpensesDocumentModel> documentModels;
  final ExpensesPageState state;

  @override
  State<ExpensesGridView> createState() => _ExpensesGridViewState();
}

class _ExpensesGridViewState extends State<ExpensesGridView> {
  Offset _tapPosition = Offset.zero;

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.state.status) {
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
                'Ładowanie dokumentów',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      case Status.success:
        if (widget.state.documents.isEmpty) {
          return const Center(
            child: Text(
              'Brak elementów do wyświetlenia',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
        }
        return GridView.builder(
            itemCount: widget.documentModels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 175,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (BuildContext context, int index) {
              final title = widget.documentModels[index].title;
              final documentId = widget.documentModels[index].id;

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
            });
      case Status.error:
        return Center(
          child: Text(
            widget.state.errorMessage!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        );
    }
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