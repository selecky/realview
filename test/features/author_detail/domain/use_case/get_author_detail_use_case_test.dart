import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/author_detail/domain/entity/author_detail.dart';
import 'package:realview/features/author_detail/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/author_detail/domain/repo/author_detail_repo.dart';
import 'package:realview/features/author_detail/domain/use_case/get_author_detail_use_case.dart';

import 'get_author_detail_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthorDetailRepo>()])
void main() {
  late MockAuthorDetailRepo mockRepo;
  late GetAuthorDetailUseCase getAuthorDetailUseCase;

  const AuthorDetail testAuthorDetail = AuthorDetail(personalName: 'testName');

  setUp(() {
    mockRepo = MockAuthorDetailRepo();
    getAuthorDetailUseCase = GetAuthorDetailUseCase(repo: mockRepo);
  });

  test('useCase should call repo and return author detail', () async {
    when(
      mockRepo.getAuthorDetail(authorId: 'testId'),
    ).thenAnswer((_) async => const ResultSuccess(authorDetail: testAuthorDetail));

    final result = await getAuthorDetailUseCase.call(params: 'testId');

    expect(result, isA<ResultSuccess>());
    if (result is ResultSuccess) {
      expect(result.authorDetail.personalName, 'testName');
    }
  });
}
