import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({
    super.key,
    required this.documentModel,
  });

  final ShopListDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    bool isChecked = documentModel.isChecked;
    return Container(
      color: const Color.fromARGB(255, 0, 51, 54),
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            documentModel.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Row(
              children: [
                Checkbox(
                    activeColor: Colors.red,
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      context
                          .read<ShopListPageCubit>()
                          .updateValue(documentModel.id, newValue!);
                    }),
                const SizedBox(
                  width: 15,
                ),
                Visibility(
                    visible: isChecked == true ? true : false,
                    child: IconButton(
                      onPressed: () {
                        context
                            .read<ShopListPageCubit>()
                            .deleteDoc(document: documentModel.id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
