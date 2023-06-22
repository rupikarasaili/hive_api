import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/course/data_source/course_remote_data_source.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/repository/course_repository.dart';

final localCourseRepositoryProvider = Provider<ICourseRepository>(
  (ref) => LocalCourseRepositoryImpl(
    courseLocalDataSource: ref.read(courseRemoteDataSourceProvider),
  ),
);

class LocalCourseRepositoryImpl implements ICourseRepository {
  final CourseRemoteDataSource courseLocalDataSource;

  LocalCourseRepositoryImpl({required this.courseLocalDataSource});

  @override
  Future<Either<Failure, bool>> addCourse(CourseEntity course) {
    return courseLocalDataSource.addCourse(course);
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() {
    return courseLocalDataSource.getAllCoursees();
  }
}
