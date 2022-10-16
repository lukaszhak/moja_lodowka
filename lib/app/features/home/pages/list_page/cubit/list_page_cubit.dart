import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/pages/list_page/model/list_document_model.dart';
import 'package:moja_lodowka/app/features/home/pages/list_page/repository/list_documents_repository.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit(this._documentsRepository)
      : super(
          const ListPageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final ListDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add({required String title}) async {
    await _documentsRepository.add(title);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      const ListPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );

    _streamSubscription =
        _documentsRepository.getShopListDocuments().listen((documents) {
      emit(ListPageState(
          documents: documents, status: Status.success, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              ListPageState(
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
