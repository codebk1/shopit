import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_meta.freezed.dart';

@freezed
class PageMeta with _$PageMeta {
  const factory PageMeta({
    required String itemId,
    required int page,
  }) = _PageMeta;
}
