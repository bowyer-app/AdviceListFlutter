import 'package:app/data/repository/advice_repository.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/advice_id.dart';
import 'package:app/domain/date_vo.dart';
import 'package:app/ui/advice/advice_tab_page_controller.dart';
import 'package:app/ui/advice/list/advice_list_item_model.dart';
import 'package:app/ui/advice/state/advice_tab_page_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:app/domain/advice_search_query.dart';

class MockAdviceRepository extends Mock implements AdviceRepository {}

class FakeAdvice extends Fake implements Advice {}

class FakeAdviceSearchQuery extends Fake implements AdviceSearchQuery {}

void main() {
  late AdviceTabPageController adviceTabPageController;
  late MockAdviceRepository mockAdviceRepository;

  final completedAdvice = Advice(
    id: AdviceId(value: 1),
    adviceText: 'completed advice',
    created: DateVO('2023-01-01'),
    updated: DateVO('2023-01-01'),
    done: true,
  );
  final inCompletedAdvice = Advice(
    id: AdviceId(value: 2),
    adviceText: 'in-completed advice',
    created: DateVO('2023-01-02'),
    updated: DateVO('2023-01-02'),
    done: false,
  );
  final mockAdviceList = [completedAdvice, inCompletedAdvice];

  setUpAll(() {
    registerFallbackValue(FakeAdvice());
    registerFallbackValue(FakeAdviceSearchQuery());
  });

  setUp(() {
    mockAdviceRepository = MockAdviceRepository();
    adviceTabPageController = AdviceTabPageController(
      adviceRepository: mockAdviceRepository,
    );
    when(() => mockAdviceRepository.loadAdviceList(query: any(named: 'query')))
        .thenAnswer((_) async => mockAdviceList);
    when(() => mockAdviceRepository.save(any())).thenAnswer((_) async {});
  });

  group('AdviceTabPageController', () {
    test('onBuildStart should load advices and update state', () async {
      // Act
      adviceTabPageController.onBuildStart();
      await Future.delayed(Duration.zero); // wait for async operations

      // Assert
      verify(() => mockAdviceRepository.loadAdviceList(query: any(named: 'query')))
          .called(1);
      expect(adviceTabPageController.debugState.adviceAllList.length, 2);
      expect(adviceTabPageController.debugState.adviceCompletedList.length, 1);
      expect(adviceTabPageController.debugState.adviceInCompletedList.length, 1);
      expect(adviceTabPageController.debugState.adviceCompletedList.first.advice, completedAdvice);
    });

    test('onEdited should load advices and update state', () async {
      // Act
      await adviceTabPageController.onEdited();

      // Assert
      verify(() => mockAdviceRepository.loadAdviceList(query: any(named: 'query')))
          .called(1);
      expect(adviceTabPageController.debugState.adviceAllList.length, 2);
    });

    test('onTapCheck should save advice, reload, and update state', () async {
      // Arrange
      final itemModel = AdviceListItemModel(advice: inCompletedAdvice);

      // Act
      await adviceTabPageController.onTapCheck(itemModel);

      // Assert
      final captured = verify(() => mockAdviceRepository.save(captureAny())).captured;
      expect(captured.first.done, isTrue); // Check that 'done' is toggled
      verify(() => mockAdviceRepository.loadAdviceList(query: any(named: 'query')))
          .called(1);
    });
  });
}
