import 'package:bloc_test/bloc_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';
import 'package:moja_lodowka/domain/repositories/menu_documents_repository/menu_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/menu_page/cubit/menu_page_cubit.dart';

class MockMenuDocumentsRepository extends Mock
    implements MenuDocumentsRepository {}

void main() {
  late MenuPageCubit sut;
  late MockMenuDocumentsRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;

  setUp(() {
    repository = MockMenuDocumentsRepository();
    sut = MenuPageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {

    blocTest<MenuPageCubit, MenuPageState>(
        'should call getMenuDocuments() method once',
        build: () => sut,
        act: (cubit) => cubit.start(),
        verify: (_) {
          verify(() => repository.getMenuDocuments()).called(1);
        });

    group('success', () {
      setUp(() async {
        await fakeFirebaseFirestore
            .collection('path')
            .doc()
            .set({'title': 'title1', 'content': 'content1'});
        final collection = fakeFirebaseFirestore.collection('path').snapshots();
        final stream = collection.map((querysnapshot) => querysnapshot.docs
            .map(
              (doc) => MenuDocumentModel(id: '1', title: doc['title'], content: doc['content'])
            )
            .toList());
        when(() => repository.getMenuDocuments()).thenAnswer((_) => stream);
      });

      blocTest<MenuPageCubit, MenuPageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                MenuPageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                MenuPageState(documents: [
                  MenuDocumentModel(
                      id: '1',
                      title: 'title1',
                      content: 'content1',)
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getMenuDocuments())
            .thenThrow(Exception('test-exception-error'));
      });

      blocTest<MenuPageCubit, MenuPageState>('emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
            MenuPageState(documents: [], status: Status.loading, errorMessage: ''),
            MenuPageState(documents: [], status: Status.error, errorMessage: 'Exception: test-exception-error')
          ]);
    });
  });
}
