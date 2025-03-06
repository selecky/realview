import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/authors/domain/entity/author_detail.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_author_detail_result.dart';
import 'package:realview/features/authors/domain/repo/authors_repo.dart';
import 'package:realview/features/authors/domain/use_case/get_author_detail_use_case.dart';

import 'get_author_detail_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthorsRepo>()])
void main() {
  late MockAuthorsRepo mockRepo;
  late GetAuthorDetailUseCase getAuthorDetailUseCase;

  const AuthorDetail testAuthorsDetail = AuthorDetail(title: 'testTitle');

  setUp(() {
    mockRepo = MockAuthorsRepo();
    getAuthorDetailUseCase = GetAuthorDetailUseCase(repo: mockRepo);
  });

  test('useCase should call repo and return authors data', () async {
    when(
      mockRepo.getAuthorDetail(isbn13: 'testIsbn13'),
    ).thenAnswer((_) async => const ResultSuccess(authorDetail: testAuthorsDetail));

    final result = await getAuthorDetailUseCase.call(params: 'testIsbn13');

    expect(result, isA<ResultSuccess>());
    if (result is ResultSuccess) {
      expect(result.authorDetail.title, 'testTitle');
    }
  });
}
