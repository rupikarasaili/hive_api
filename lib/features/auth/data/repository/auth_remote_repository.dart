import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/auth/domain/entity/student_entity.dart';

import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }

  AuthRemoteRepository(this._authRemoteDataSource);
  @override
  Future<Either<Failure, bool>> loginStudent(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> registerStudent(StudentEntity student) {
    // TODO: implement registerStudent
    throw UnimplementedError();
  }
}
