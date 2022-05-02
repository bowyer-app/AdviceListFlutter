import 'package:app/data/local/advice_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final adviceDataSourceProvider = Provider((ref) => AdviceDataSource());
