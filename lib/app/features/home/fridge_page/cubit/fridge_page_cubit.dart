import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/model/fridge_document_model.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/repository/fridge_documents_repository.dart';

part 'fridge_page_state.dart';

class FridgePageCubit extends Cubit<FridgePageState> {
  FridgePageCubit(this._documentsRepository)
      : super(const FridgePageState(
          documents: [],
        ));

  final FridgeDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expDate) async {
    await _documentsRepository.add(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(FridgePageState(
        documents: documents,
      ));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
