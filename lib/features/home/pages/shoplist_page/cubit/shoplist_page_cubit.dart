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

  Future<void> update(String document, bool newValue) async {
    await _documentsRepository.update(document, newValue);
  }

  Future<void> add({required String title, required bool isChecked}) async {
    await _documentsRepository.add(title, isChecked);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      ShopListPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );

    _streamSubscription =
        _documentsRepository.getShopListDocuments().listen((documents) {
      emit(ShopListPageState(
          documents: documents, status: Status.success, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              ShopListPageState(
                documents: const [],
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
