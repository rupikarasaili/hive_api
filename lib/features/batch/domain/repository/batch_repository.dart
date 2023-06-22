import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';

import '../../data/repository/batch_local_data_source.dart';

final batchRepositoryProvider = Provider<IBatchRepository>((ref) {
  // Return Local repository implementation
  // For internet connectivity we will check later
  return ref.read(batchRemoteRepoProvider);
});


abstract class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, bool>> addBatch(BatchEntity batch);
}
