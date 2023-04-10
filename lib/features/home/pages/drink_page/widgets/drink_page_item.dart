import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moja_lodowka/domain/models/drink_document_model/drink_document_model.dart';


class DrinkPageItem extends StatelessWidget {
  const DrinkPageItem({
    Key? key,
    required this.documentModel,
  }) : super(key: key);

  final DrinkDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    if (documentModel.daysToExpire() <= documentModel.outDated()) {
      return ItemContainer(documentModel: documentModel, color: Colors.black);
    }
    if (documentModel.daysToExpire() <= documentModel.closeCall()) {
      return ItemContainer(
        documentModel: documentModel,
        color: const Color.fromARGB(255, 255, 0, 0),
      );
    }
    return ItemContainer(
      documentModel: documentModel,
      color: const Color.fromARGB(255, 0, 51, 54),
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer(
      {Key? key, required this.documentModel, required this.color})
      : super(key: key);

  final DrinkDocumentModel documentModel;
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
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.expDate,
                style: const TextStyle(color: Colors.white),
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
