import 'package:equatable/equatable.dart';

sealed class NetworkResult<T> extends Equatable {
  const NetworkResult({this.data, this.errorMessage});

  final T? data;
  final String? errorMessage;
}

class NetworkResultSuccess<T> extends NetworkResult<T> {
  const NetworkResultSuccess({super.data});

  @override
  List<Object?> get props => [data];
}

class NetworkResultFailure<T> extends NetworkResult<T> {
  const NetworkResultFailure({super.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
