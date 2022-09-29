import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/features/home/menu_page/model/menu_document_model.dart';
import 'package:moja_lodowka/app/features/home/menu_page/repository/menu_documents_repository.dart';

part 'menu_page_state.dart';

class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit(this._documentsRepository)
      : super(
          const MenuPageState(
            documents: [],
          ),
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
        documents: [],
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(MenuPageState(
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
