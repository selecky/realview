import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:realview/features/authors/domain/entity/authors_data.dart';
import 'package:realview/features/authors/domain/entity/result_entity/get_authors_result.dart';
import 'package:realview/features/authors/domain/repo/authors_repo.dart';
import 'package:realview/features/authors/domain/use_case/get_authors_use_case.dart';

import 'get_authors_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthorsRepo>()])
void main() {
  late MockAuthorsRepo mockRepo;
  late GetAuthorsUseCase getAuthorsUseCase;

  const AuthorsData testAuthorsData = AuthorsData(docs: [Author(name: 'testName')]);

  setUp(() {
    mockRepo = MockAuthorsRepo();
    getAuthorsUseCase = GetAuthorsUseCase(repo: mockRepo);
  });

  test('useCase should call repo and return authors data', () async {
    when(
      mockRepo.getAuthors(keyword: 'testKeyword'),
    ).thenAnswer((_) async => const ResultSuccess(authorsData: testAuthorsData));

    final result = await getAuthorsUseCase.call(params: 'testKeyword');

    expect(result, isA<ResultSuccess>());
    if (result is ResultSuccess) {
      expect(result.authorsData.docs?.first.name, 'testName');
    }
  });
}
