import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/fridge_document_model/fridge_document_model.dart';
import 'package:moja_lodowka/domain/repositories/fridge_documents_repository/fridge_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/fridge_page/cubit/fridge_page_cubit.dart';

class MockFridgeDocumentsRepository extends Mock
    implements FridgeDocumentsRepository {}

void main() {
  late FridgePageCubit sut;
  late MockFridgeDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  final expDate = DateTime(2023, 7, 22);

  setUp(() {
    repository = MockFridgeDocumentsRepository();
    sut = FridgePageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {
    group('success', () {
      setUp(() async {
        await fakeFirebaseFirestore
            .collection('path')
            .doc()
            .set({'title': 'title1', 'expDate': expDate, 'notificationid': 1});
        final collection = fakeFirebaseFirestore.collection('path').snapshots();
        final stream = collection.map((querysnapshot) => querysnapshot.docs
            .map(
              (doc) => FridgeDocumentModel(
                id: '1',
                title: doc['title'],
                expDate: (doc['expDate'] as Timestamp).toDate(),
                notificationId: doc['notificationid'],
              ),
            )
            .toList());
        when(() => repository.getFridgeDocuments()).thenAnswer((_) => stream);
      });

      blocTest<FridgePageCubit, FridgePageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                FridgePageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                FridgePageState(documents: [
                  FridgeDocumentModel(
                      id: '1',
                      title: 'title1',
                      expDate: expDate,
                      notificationId: 1)
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getFridgeDocuments())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<FridgePageCubit, FridgePageState>('emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
            FridgePageState(documents: [], status: Status.loading, errorMessage: ''),
            FridgePageState(documents: [], status: Status.error, errorMessage: 'Exception: test-exception-error')
          ]);
    });
  });
}
