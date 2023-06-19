// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class ProviderState<T> implements Equatable {
  final T? value;
  final bool isLoading;
  final bool isInit;
  final bool isError;
  final String? error;
  const ProviderState({
    required this.value,
    required this.isLoading,
    required this.isInit,
    required this.isError,
    this.error,
  });

  static InitialState<T> init<T>() => InitialState<T>();
  static LoadingState<T> loading<T>({T? value}) =>
      LoadingState<T>(value: value);
  static SuccessState<T> success<T>({required T value}) =>
      SuccessState<T>(value: value);
  static ErrorState<T> erroR<T>({
    required String error,
    T? value,
  }) =>
      ErrorState<T>(error: error, value: value);

  static Future<ProviderState<T>> guard<T>(
      {required Future<Either<String, T>> Function() function,
      T? oldValue}) async {
    final res = await function();
    return res.fold((l) => ProviderState.erroR(error: l, value: oldValue),
        (r) => ProviderState.success(value: r));
  }

  R when<R>({
    required R Function() onInit,
    required R Function(T? value) onLoading,
    required R Function(T value) onSuccess,
    required R Function(T? value, String error) onError,
  });

  R maybeWhen<R>({
    required R Function() orElse,
    R Function()? onInit,
    R Function(T? value)? onLoading,
    R Function(T value)? onSuccess,
    R Function(T? value, String error)? onError,
  });
}

class InitialState<T> extends ProviderState<T> {
  const InitialState()
      : super(
            value: null,
            isLoading: false,
            isError: false,
            isInit: true,
            error: null);

  @override
  List<Object?> get props => [
        super.value,
        super.isInit,
        super.isLoading,
        super.isError,
        super.error,
      ];

  @override
  bool? get stringify => true;

  @override
  R when<R>(
      {required R Function() onInit,
      required R Function(T? value) onLoading,
      required R Function(T value) onSuccess,
      required R Function(T? value, String error) onError}) {
    return onInit();
  }

  @override
  R maybeWhen<R>(
      {required R Function() orElse,
      R Function()? onInit,
      R Function(T? value)? onLoading,
      R Function(T value)? onSuccess,
      R Function(T? value, String error)? onError}) {
    if (onInit == null) {
      return orElse();
    }
    return onInit();
  }
}

class LoadingState<T> extends ProviderState<T> {
  const LoadingState({
    super.value,
  }) : super(isLoading: true, isError: false, isInit: false, error: null);

  @override
  List<Object?> get props => [
        super.value,
        super.isInit,
        super.isLoading,
        super.isError,
        super.error,
      ];

  @override
  bool? get stringify => true;

  @override
  R when<R>(
      {required R Function() onInit,
      required R Function(T? value) onLoading,
      required R Function(T value) onSuccess,
      required R Function(T? value, String error) onError}) {
    return onLoading(value);
  }

  @override
  R maybeWhen<R>(
      {required R Function() orElse,
      R Function()? onInit,
      R Function(T? value)? onLoading,
      R Function(T value)? onSuccess,
      R Function(T? value, String error)? onError}) {
    if (onLoading == null) {
      return orElse();
    }
    return onLoading(value);
  }
}

class SuccessState<T> extends ProviderState<T> {
  final T value;
  const SuccessState({
    required this.value,
  }) : super(
            value: value,
            isLoading: false,
            isError: false,
            isInit: false,
            error: null);

  @override
  List<Object?> get props => [
        super.value,
        super.isInit,
        super.isLoading,
        super.isError,
        super.error,
      ];

  @override
  bool? get stringify => true;

  @override
  R when<R>(
      {required R Function() onInit,
      required R Function(T? value) onLoading,
      required R Function(T value) onSuccess,
      required R Function(T? value, String error) onError}) {
    return onSuccess(value);
  }

  @override
  R maybeWhen<R>(
      {required R Function() orElse,
      R Function()? onInit,
      R Function(T? value)? onLoading,
      R Function(T value)? onSuccess,
      R Function(T? value, String error)? onError}) {
    if (onSuccess == null) {
      return orElse();
    }
    return onSuccess(value);
  }
}

class ErrorState<T> extends ProviderState<T> {
  final String error;
  final T? value;
  const ErrorState({
    required this.error,
    this.value,
  }) : super(
            value: value,
            isLoading: false,
            isError: true,
            isInit: false,
            error: error);

  @override
  List<Object?> get props => [
        super.value,
        super.isInit,
        super.isLoading,
        super.isError,
        super.error,
      ];

  @override
  bool? get stringify => true;

  @override
  R when<R>(
      {required R Function() onInit,
      required R Function(T? value) onLoading,
      required R Function(T value) onSuccess,
      required R Function(T? value, String error) onError}) {
    return onError(value, error);
  }

  @override
  R maybeWhen<R>(
      {required R Function() orElse,
      R Function()? onInit,
      R Function(T? value)? onLoading,
      R Function(T value)? onSuccess,
      R Function(T? value, String error)? onError}) {
    if (onError == null) {
      return orElse();
    }
    return onError(value, error);
  }
}
