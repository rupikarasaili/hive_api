import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/repository/course_repository.dart';

final courseUseCaseProvider = Provider<CourseUseCase>(
  (ref) => CourseUseCase(
    courseRepository: ref.read(courseRepositoryProvider),
  ),
);

class CourseUseCase {
  final ICourseRepository courseRepository;

  CourseUseCase({required this.courseRepository});

  Future<Either<dynamic, List<CourseEntity>>> getAllCourses() {
    return courseRepository.getAllCourses();
  }

  Future<Either<dynamic, bool>> addCourse(CourseEntity course) {
    return courseRepository.addCourse(course);
  }
}
