import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/longdate_document_model/longdate_document_model.dart';
import 'package:moja_lodowka/domain/repositories/longdate_documents_repository/longdate_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/longdate_page/cubit/longdate_page_cubit.dart';

class MockLongDateDocumentsRepository extends Mock
    implements LongDateDocumentsRepository {}

void main() {
  late LongDatePageCubit sut;
  late MockLongDateDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  final expDate = DateTime(2023, 7, 22);

  setUp(() {
    repository = MockLongDateDocumentsRepository();
    sut = LongDatePageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {

    blocTest<LongDatePageCubit, LongDatePageState>(
        'should call getLongDateDocuments() method once',
        build: () => sut,
        act: (cubit) => cubit.start(),
        verify: (_) {
          verify(() => repository.getLongDateDocuments()).called(1);
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
              (doc) => LongDateDocumentModel(
                id: '1',
                title: doc['title'],
                expDate: (doc['expDate'] as Timestamp).toDate(),
                notificationId: doc['notificationid'],
              ),
            )
            .toList());
        when(() => repository.getLongDateDocuments()).thenAnswer((_) => stream);
      });

      blocTest<LongDatePageCubit, LongDatePageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                LongDatePageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                LongDatePageState(documents: [
                  LongDateDocumentModel(
                      id: '1',
                      title: 'title1',
                      expDate: expDate,
                      notificationId: 1)
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getLongDateDocuments())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<LongDatePageCubit, LongDatePageState>('emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
            LongDatePageState(documents: [], status: Status.loading, errorMessage: ''),
            LongDatePageState(documents: [], status: Status.error, errorMessage: 'Exception: test-exception-error')
          ]);
    });
  });
}
