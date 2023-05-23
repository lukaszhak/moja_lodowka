import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/candy_document_model/candy_document_model.dart';
import 'package:moja_lodowka/domain/repositories/candy_documents_repository/candy_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/candy_page/cubit/candy_page_cubit.dart';

class MockCandyDocumentsRepository extends Mock
    implements CandyDocumentsRepository {}

void main() {
  late CandyPageCubit sut;
  late MockCandyDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  final expDate = DateTime(2023, 6, 15);

  setUp(() {
    repository = MockCandyDocumentsRepository();
    sut = CandyPageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {
    setUp(() async {
      await fakeFirebaseFirestore
          .collection('path')
          .doc()
          .set({'title': 'title1', 'expDate': expDate, 'notificationid': 1});
      final collection = fakeFirebaseFirestore.collection('path').snapshots();
      final stream = collection.map((querysnapshot) => querysnapshot.docs
          .map(
            (doc) => CandyDocumentModel(
              id: '1',
              title: doc['title'],
              expDate: (doc['expDate'] as Timestamp).toDate(),
              notificationId: doc['notificationid'],
            ),
          )
          .toList());
      when(() => repository.getCandysDocuments()).thenAnswer((_) => stream);
    });

    blocTest<CandyPageCubit, CandyPageState>(
        'emits Status.loading then Status.success with results',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
              CandyPageState(
                  documents: [], status: Status.loading, errorMessage: ''),
              CandyPageState(
                  documents: [
                    CandyDocumentModel(id: '1', title: 'title1', expDate: expDate, notificationId: 1)
                  ], status: Status.success, errorMessage: '')
            ]);
  });
}
