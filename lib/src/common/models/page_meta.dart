import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_meta.freezed.dart';

@freezed
class PageMeta<T> with _$PageMeta<T> {
  const factory PageMeta({
    required List<T> items,
    @Default(false) bool isLoading,
    @Default(false) bool noMoreItems,
    Object? error,
  }) = _PageMeta<T>;
}
