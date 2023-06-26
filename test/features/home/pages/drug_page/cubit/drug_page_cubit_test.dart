import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/drug_document_model/drug_document_model.dart';
import 'package:moja_lodowka/domain/repositories/drug_documents_repository/drug_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/drug_page/cubit/drug_page_cubit.dart';

class MockDrugDocumentsRepository extends Mock
    implements DrugDocumentsRepository {}

void main() {
  late DrugPageCubit sut;
  late MockDrugDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  final expDate = DateTime(2023, 7, 22);

  setUp(() {
    repository = MockDrugDocumentsRepository();
    sut = DrugPageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {

    blocTest<DrugPageCubit, DrugPageState>(
        'should call getDrugsDocuments() method once',
        build: () => sut,
        act: (cubit) => cubit.start(),
        verify: (_) {
          verify(() => repository.getDrugsDocuments()).called(1);
        });

    group('success', () {
      setUp(() async {
        await fakeFirebaseFirestore
            .collection('path')
            .doc()
            .set({'title': 'title1', 'expDate': expDate, 'notificationid': 1});
        final collection = fakeFirebaseFirestore.collection('path').snapshots();
        final stream = collection.map((querysnapshot) => querysnapshot.docs
            .map(
              (doc) => DrugDocumentModel(
                id: '1',
                title: doc['title'],
                expDate: (doc['expDate'] as Timestamp).toDate(),
                notificationId: doc['notificationid'],
              ),
            )
            .toList());
        when(() => repository.getDrugsDocuments()).thenAnswer((_) => stream);
      });

      blocTest<DrugPageCubit, DrugPageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                DrugPageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                DrugPageState(documents: [
                  DrugDocumentModel(
                      id: '1',
                      title: 'title1',
                      expDate: expDate,
                      notificationId: 1)
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getDrugsDocuments())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<DrugPageCubit, DrugPageState>('emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
            DrugPageState(documents: [], status: Status.loading, errorMessage: ''),
            DrugPageState(documents: [], status: Status.error, errorMessage: 'Exception: test-exception-error')
          ]);
    });
  });
}
