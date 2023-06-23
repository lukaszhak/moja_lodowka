import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/expenses_document_model/expenses_document_model.dart';
import 'package:moja_lodowka/domain/repositories/expenses_documents_repository/expenses_documents_repository.dart';
import 'package:moja_lodowka/features/home/pages/expenses_page/cubit/expenses_page_cubit.dart';

class MockExpensesDocumentRepository extends Mock
    implements ExpensesDocumentsRepository {}

void main() {
  late ExpensesPageCubit sut;
  late MockExpensesDocumentRepository repository;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  final expensesDate = DateTime(2023, 5, 22);

  setUp(() {
    repository = MockExpensesDocumentRepository();
    sut = ExpensesPageCubit(repository);
    fakeFirebaseFirestore = FakeFirebaseFirestore();
  });

  group('start', () {
    group('success', () {
      setUp(() async {
        await fakeFirebaseFirestore.collection('path').doc().set({
          'category': 'category1',
          'amount': 10,
          'title': 'title1',
          'expensesDate': expensesDate
        });
        final collection = fakeFirebaseFirestore.collection('path').snapshots();
        final stream = collection.map((querysnapshot) => querysnapshot.docs
            .map(
              (doc) => ExpensesDocumentModel(
                category: doc['category'],
                amount: doc['amount'],
                id: '1',
                title: doc['title'],
                expensesDate: (doc['expensesDate'] as Timestamp).toDate(),
              ),
            )
            .toList());
        when(() => repository.getExpensesDocuments()).thenAnswer((_) => stream);
      });

      blocTest<ExpensesPageCubit, ExpensesPageState>(
          'emits Status.loading then Status.success with results',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                ExpensesPageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                ExpensesPageState(documents: [
                  ExpensesDocumentModel(
                    category: 'category1',
                    amount: 10,
                    id: '1',
                    title: 'title1',
                    expensesDate: expensesDate,
                  ),
                ], status: Status.success, errorMessage: '')
              ]);
    });

    group('failure', () {
      setUp(() {
        when(() => repository.getExpensesDocuments()).thenThrow(
          Exception('test-exception-error'),
        );
      });

      blocTest<ExpensesPageCubit, ExpensesPageState>(
          'emits Status.loading then Status.error with error message',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: () => [
                ExpensesPageState(
                    documents: [], status: Status.loading, errorMessage: ''),
                ExpensesPageState(
                    documents: [],
                    status: Status.error,
                    errorMessage: 'Exception: test-exception-error')
              ]);
    });

    test('should call getExpensesDocuments() method once', () async {
      await sut.start();
      verify(() => repository.getExpensesDocuments()).called(1);
    });
  });
}
