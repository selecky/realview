part of 'app.dart';

Dio _getDio({required String endpoint}) {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: endpoint,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  // dio.options.headers['Api-Key'] = '';
  dio.options.baseUrl = Strings.api_base_url;

  if (!kIsWeb) {
    dio.interceptors.add(RequestsInspectorInterceptor());
  }
  return dio;
}
