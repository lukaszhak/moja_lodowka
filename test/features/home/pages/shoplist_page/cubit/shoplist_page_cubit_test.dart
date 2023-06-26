import 'package:bloc_test/bloc_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';
import 'package:moja_lodowka/domain/repositories/shoplist_documents_repository/shoplist_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/shoplist_page/cubit/shoplist_page_cubit.dart';

class MockShopListDocumentsRepository extends Mock
    implements ShopListDocumentsRepository {}

void main() {
  late ShopListPageCubit sut;
  late MockShopListDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;

  setUp(() {
    repository = MockShopListDocumentsRepository();
    sut = ShopListPageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {

    blocTest<ShopListPageCubit, ShopListPageState>(
        'should call getShopListDocuments() method once',
        build: () => sut,
        act: (cubit) => cubit.start(),
        verify: (_) {
          verify(() => repository.getShopListDocuments()).called(1);
        });

    group('success', () {
      setUp(() async {
        await fakeFirebaseFirestore
            .collection('path')
            .doc()
            .set({'title': 'title1', 'ischecked': false});
        final collection = fakeFirebaseFirestore.collection('path').snapshots();
        final stream = collection.map((querysnapshot) => querysnapshot.docs
            .map(
              (doc) => ShopListDocumentModel(
                id: '1',
                title: doc['title'],
                isChecked: doc['ischecked']
              ),
            )
            .toList());
        when(() => repository.getShopListDocuments()).thenAnswer((_) => stream);
      });

      blocTest<ShopListPageCubit, ShopListPageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                ShopListPageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                ShopListPageState(documents: [
                  ShopListDocumentModel(
                      id: '1',
                      title: 'title1',
                      isChecked: false)
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getShopListDocuments())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<ShopListPageCubit, ShopListPageState>('emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
            ShopListPageState(documents: [], status: Status.loading, errorMessage: ''),
            ShopListPageState(documents: [], status: Status.error, errorMessage: 'Exception: test-exception-error')
          ]);
    });
  });
}
