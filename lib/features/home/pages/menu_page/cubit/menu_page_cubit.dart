import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart';

part 'menu_page_state.dart';

class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit(this._documentsRepository)
      : super(
          const MenuPageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final MenuDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> update(
      {required String content, required String document}) async {
    await _documentsRepository.update(content, document);
  }

  Future<void> add({required String title, required String content}) async {
    await _documentsRepository.add(title, content);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      const MenuPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );

    _streamSubscription =
        _documentsRepository.getMenuDocuments().listen((documents) {
      emit(MenuPageState(
          documents: documents, status: Status.success, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              MenuPageState(
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
