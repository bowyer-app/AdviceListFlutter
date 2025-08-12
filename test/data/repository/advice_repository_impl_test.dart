import 'package:app/data/local/advice_data_source.dart';
import 'package:app/data/repository/advice_repository_impl.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/advice_id.dart';
import 'package:app/domain/advice_search_query.dart';
import 'package:app/domain/date_vo.dart';
import 'package:app/domain/hide_filter.dart';
import 'package:app/domain/sort_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceDataSource extends Mock implements AdviceDataSource {}

class FakeAdviceSearchQuery extends Fake implements AdviceSearchQuery {}

class FakeAdvice extends Fake implements Advice {}

void main() {
  late AdviceRepositoryImpl adviceRepository;
  late MockAdviceDataSource mockAdviceDataSource;

  setUpAll(() {
    registerFallbackValue(FakeAdviceSearchQuery());
    registerFallbackValue(FakeAdvice());
  });

  setUp(() {
    mockAdviceDataSource = MockAdviceDataSource();
    adviceRepository = AdviceRepositoryImpl(
      adviceDataSource: mockAdviceDataSource,
    );
  });

  group('AdviceRepositoryImpl', () {
    final testAdvice = Advice(
      id: AdviceId(value: 1),
      adviceText: 'test advice',
      created: DateVO('2023-01-01'),
      updated: DateVO('2023-01-01'),
      done: false,
    );

    final testQuery = AdviceSearchQuery(
      searchText: '',
      sortType: SortType.asc,
      hideDone: HideFilter.display,
    );

    test('loadAdviceList should return advice list from data source', () async {
      // Arrange
      when(() => mockAdviceDataSource.loadAdviceList(query: any(named: 'query')))
          .thenAnswer((_) async => [testAdvice]);

      // Act
      final result = await adviceRepository.loadAdviceList(query: testQuery);

      // Assert
      expect(result, [testAdvice]);
      verify(() => mockAdviceDataSource.loadAdviceList(query: testQuery)).called(1);
    });

    test('save should call save on data source', () async {
      // Arrange
      when(() => mockAdviceDataSource.save(any())).thenAnswer((_) async {});

      // Act
      await adviceRepository.save(testAdvice);

      // Assert
      verify(() => mockAdviceDataSource.save(testAdvice)).called(1);
    });

    test('loadAdviceList should rethrow exception when data source throws', () {
      // Arrange
      when(() => mockAdviceDataSource.loadAdviceList(query: any(named: 'query')))
          .thenThrow(Exception('DataSource Error'));

      // Act & Assert
      expect(
        () => adviceRepository.loadAdviceList(query: testQuery),
        throwsA(isA<Exception>()),
      );
    });

    test('save should rethrow exception when data source throws', () {
      // Arrange
      when(() => mockAdviceDataSource.save(any()))
          .thenThrow(Exception('DataSource Error'));

      // Act & Assert
      expect(
        () => adviceRepository.save(testAdvice),
        throwsA(isA<Exception>()),
      );
    });
  });
}
