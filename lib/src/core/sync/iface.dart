part of 'base.dart';

/// {@template remote_storage}
/// Remote storage interface.
///
/// All valid internal impls:
///   - [_Webdav]
///   - [_ICloud]
/// {@endtemplate}
abstract base class RemoteStorage<InitArgs, ListItemType> {
  /// Initialize remote storage
  Future<void> init(InitArgs args);

  /// Upload file to remote storage
  ///
  /// {@template remote_storage_upload}
  /// - [relativePath] is the path relative to [docDir],
  /// must not starts with `/`
  /// - [localPath] has higher priority than [relativePath], but only apply
  /// to the local path instead of iCloud path
  ///
  /// Return `(void, null)` if upload success, `(null, Object)` otherwise
  /// {@endtemplate}
  Future<void> upload({required String relativePath, String? localPath});

  /// List files in remote storage
  ///
  /// {@macro remote_storage_upload}
  Future<void> delete(String relativePath);

  /// Download file from remote storage
  ///
  /// {@macro remote_storage_upload}
  Future<void> download({required String relativePath, String? localPath});

  /// List files in remote storage
  Future<List<ListItemType>> list();
}

abstract class Mergeable {
  /// Merge backup with current data
  Future<void> merge();
}
