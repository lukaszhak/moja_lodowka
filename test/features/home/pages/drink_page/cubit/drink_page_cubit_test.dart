import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/drink_document_model/drink_document_model.dart';
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/drink_page/cubit/drink_page_cubit.dart';

class MockDrinkDocumentsRepository extends Mock
    implements DrinkDocumentsRepository {}

void main() {
  late DrinkPageCubit sut;
  late MockDrinkDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  final expDate = DateTime(2023, 7, 22);

  setUp(() {
    repository = MockDrinkDocumentsRepository();
    sut = DrinkPageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {

    blocTest<DrinkPageCubit, DrinkPageState>(
        'should call getDrinksDocuments() method once',
        build: () => sut,
        act: (cubit) => cubit.start(),
        verify: (_) {
          verify(() => repository.getDrinksDocuments()).called(1);
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
              (doc) => DrinkDocumentModel(
                id: '1',
                title: doc['title'],
                expDate: (doc['expDate'] as Timestamp).toDate(),
                notificationId: doc['notificationid'],
              ),
            )
            .toList());
        when(() => repository.getDrinksDocuments()).thenAnswer((_) => stream);
      });

      blocTest<DrinkPageCubit, DrinkPageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                DrinkPageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                DrinkPageState(documents: [
                  DrinkDocumentModel(
                      id: '1',
                      title: 'title1',
                      expDate: expDate,
                      notificationId: 1)
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getDrinksDocuments())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<DrinkPageCubit, DrinkPageState>('emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
            DrinkPageState(documents: [], status: Status.loading, errorMessage: ''),
            DrinkPageState(documents: [], status: Status.error, errorMessage: 'Exception: test-exception-error')
          ]);
    });
  });
}
