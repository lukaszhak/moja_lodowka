import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/model/longdate_document_model.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/repository/longdate_documents_repository.dart';

part 'longdate_page_state.dart';

class LongdatePageCubit extends Cubit<LongdatePageState> {
  LongdatePageCubit(this._documentsRepository)
      : super(
          const LongdatePageState(
            documents: [],
          ),
        );

  final LongDateDocumentsRepository _documentsRepository;

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
      emit(LongdatePageState(documents: documents));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
