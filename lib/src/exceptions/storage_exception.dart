import 'package:shopit/src/l10n/l10n.dart';

sealed class StorageException implements Exception {
  const StorageException();

  factory StorageException.fromCode(Object code) {
    return switch (code) {
      'object-not-found' => ObjectNotFoundException(),
      'bucket-not-found' => BucketNotFoundException(),
      'project-not-found' => ProjectNotFoundException(),
      'quota-exceeded' => QuotaExceededException(),
      'unauthenticated' => UnauthenticatedException(),
      'unauthorized' => UnauthorizedException(),
      'retry-limit-exceeded' => RetryLimitExceededException(),
      'invalid-checksum' => InvalidChecksumException(),
      'canceled' => CanceledException(),
      'invalid-event-name' => InvalidEventNameException(),
      'invalid-url' => InvalidUrlException(),
      'invalid-argument' => InvalidArgumentException(),
      'no-default-bucket' => NoDefaultBucketException(),
      'cannot-slice-blob' => CannotSliceBlobException(),
      'server-file-wrong-size' => ServerFileWrongSizeException(),
      _ => StorageUnknownException(),
    };
  }
}

class ObjectNotFoundException extends StorageException {}

class BucketNotFoundException extends StorageException {}

class ProjectNotFoundException extends StorageException {}

class QuotaExceededException extends StorageException {}

class UnauthenticatedException extends StorageException {}

class UnauthorizedException extends StorageException {}

class RetryLimitExceededException extends StorageException {}

class InvalidChecksumException extends StorageException {}

class CanceledException extends StorageException {}

class InvalidEventNameException extends StorageException {}

class InvalidUrlException extends StorageException {}

class InvalidArgumentException extends StorageException {}

class NoDefaultBucketException extends StorageException {}

class CannotSliceBlobException extends StorageException {}

class ServerFileWrongSizeException extends StorageException {}

class StorageUnknownException extends StorageException {}

extension StorageExceptionExtension on StorageException {
  String l10n(AppLocalizations l10n) {
    return switch (this) {
      ObjectNotFoundException() => l10n.storageExceptionObjectNotFound,
      BucketNotFoundException() => l10n.storageExceptionBucketNotFound,
      ProjectNotFoundException() => l10n.storageExceptionProjectNotFound,
      QuotaExceededException() => l10n.storageExceptionQuotaExceeded,
      UnauthenticatedException() => l10n.storageExceptionUnauthenticated,
      UnauthorizedException() => l10n.storageExceptionUnauthorized,
      RetryLimitExceededException() => l10n.storageExceptionRetryLimitExceeded,
      InvalidChecksumException() => l10n.storageExceptionInvalidChecksum,
      CanceledException() => l10n.storageExceptionCanceled,
      InvalidEventNameException() => l10n.storageExceptionInvalidEventName,
      InvalidUrlException() => l10n.storageExceptionInvalidUrl,
      InvalidArgumentException() => l10n.storageExceptionInvalidArgument,
      NoDefaultBucketException() => l10n.storageExceptionNoDefaultBucket,
      CannotSliceBlobException() => l10n.storageExceptionCannotSliceBlob,
      ServerFileWrongSizeException() =>
        l10n.storageExceptionServerFileWrongSize,
      StorageUnknownException() => l10n.storageExceptionUnknown,
    };
  }
}
