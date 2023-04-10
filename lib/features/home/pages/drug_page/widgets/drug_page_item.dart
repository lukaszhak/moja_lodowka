import 'package:flutter/material.dart';
import 'package:moja_lodowka/domain/models/drug_document_model/drug_document_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DrugPageItem extends StatelessWidget {
  const DrugPageItem({
    required this.documentModel,
    Key? key,
  }) : super(key: key);

  final DrugDocumentModel documentModel;

  @override
  Widget build(BuildContext context) {
    if (documentModel.daysToExpire() <= documentModel.outDated()) {
      return _ItemContainer(documentModel: documentModel, color: Colors.black);
    }
    if (documentModel.daysToExpire() <= documentModel.closeCall()) {
      return _ItemContainer(
        documentModel: documentModel,
        color: const Color.fromARGB(255, 255, 0, 0),
      );
    }
    return _ItemContainer(
      documentModel: documentModel,
      color: const Color.fromARGB(255, 0, 51, 54),
    );
  }
}

class _ItemContainer extends StatelessWidget {
  const _ItemContainer(
      {Key? key, required this.documentModel, required this.color})
      : super(key: key);

  final DrugDocumentModel documentModel;
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
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
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
