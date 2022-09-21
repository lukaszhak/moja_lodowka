import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/features/home/list_page/model/list_document_model.dart';
import 'package:moja_lodowka/app/features/home/list_page/repository/list_documents_repository.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit(this._documentsRepository)
      : super(
          const ListPageState(
            documents: [],
          ),
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
        documents: [],
      ),
    );

    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(ListPageState(
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
