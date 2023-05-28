import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';
import 'package:moja_lodowka/domain/repositories/shoplist_documents_repository/shoplist_documents_repository.dart';

part 'shoplist_page_state.dart';
part 'shoplist_page_cubit.freezed.dart';

@injectable
class ShopListPageCubit extends Cubit<ShopListPageState> {
  ShopListPageCubit(this._documentsRepository)
      : super(
          ShopListPageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final ShopListDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> updateValue(String document, bool newValue) async {
    await _documentsRepository.updateValue(document, newValue);
  }

  Future<void> addDoc({required String title, required bool isChecked}) async {
    await _documentsRepository.addDocument(title, isChecked);
  }

  Future<void> deleteDoc({required String document}) async {
    await _documentsRepository.deleteDocument(document: document);
  }

  Future<void> start() async {
    emit(
      ShopListPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );

    try {
      _streamSubscription =
          _documentsRepository.getShopListDocuments().listen((documents) {
        emit(ShopListPageState(
            documents: documents, status: Status.success, errorMessage: ''));
      });
    } catch (error) {
      emit(
        ShopListPageState(
          documents: [],
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
