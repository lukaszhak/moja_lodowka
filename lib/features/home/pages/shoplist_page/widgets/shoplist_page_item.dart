import 'package:flutter/material.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';


class ShoppingListItem extends StatefulWidget {
  const ShoppingListItem({super.key, 
    required this.documentModel,
  });

  final ShopListDocumentModel documentModel;

  @override
  State<ShoppingListItem> createState() => ShoppingListItemState();
}

class ShoppingListItemState extends State<ShoppingListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 51, 54),
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.documentModel.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                activeColor: Colors.green,
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
          )
        ],
      ),
    );
  }
}