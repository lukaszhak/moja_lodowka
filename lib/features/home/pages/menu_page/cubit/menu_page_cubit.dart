import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart';

part 'menu_page_state.dart';
part 'menu_page_cubit.freezed.dart';

@injectable
class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit(this._documentsRepository)
      : super(
          MenuPageState(
              documents: [],
              status: Status.initial,
              errorMessage: '',
              currentIndex: 0),
        );

  final MenuDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> newIndex({required int newIndex}) async {
    emit(
      state.copyWith(
        currentIndex: newIndex,
      ),
    );
  }

  Future<void> updateDoc(
      {required String content, required String document}) async {
    await _documentsRepository.updateDocument(content, document);
  }

  Future<void> addDoc({required String title, required String content}) async {
    await _documentsRepository.addDocument(title, content);
  }

  Future<void> deleteDoc({required String document}) async {
    await _documentsRepository.deleteDocument(document: document);
  }

  Future<void> start() async {
    emit(
      state.copyWith(status: Status.loading),
    );

    try {
      _streamSubscription =
          _documentsRepository.getMenuDocuments().listen((documents) {
        emit(
          state.copyWith(documents: documents, status: Status.success),
        );
      });
    } catch (error) {
      emit(
        state.copyWith(
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
