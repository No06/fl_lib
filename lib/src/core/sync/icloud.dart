part of 'base.dart';

const icloud = _ICloud._();

final class _ICloud implements RemoteStorage<String, ICloudFile> {
  const _ICloud._();

  static String containerId = '';

  /// [args] is the container ID.
  @override
  Future<void> init(String args) async {
    if (containerId == args) return;
    containerId = args;
  }

  @override
  Future<void> upload({
    required String relativePath,
    String? localPath,
  }) async {
    final completer = Completer<void>();
    await ICloudStorage.upload(
      containerId: containerId,
      filePath: localPath ?? Paths.doc.joinPath(relativePath),
      destinationRelativePath: relativePath,
      onProgress: (stream) {
        stream.listen(
          null,
          onDone: () => completer.complete(null),
          onError: (Object e) => completer.completeError(e),
        );
      },
    );
    return completer.future;
  }

  @override
  Future<List<ICloudFile>> list() {
    return ICloudStorage.gather(containerId: containerId);
  }

  @override
  Future<void> delete(String relativePath) {
    return ICloudStorage.delete(
      containerId: containerId,
      relativePath: relativePath,
    );
  }

  @override
  Future<void> download({
    required String relativePath,
    String? localPath,
  }) async {
    final completer = Completer<void>();
    await ICloudStorage.download(
      containerId: containerId,
      relativePath: relativePath,
      destinationFilePath: localPath ?? Paths.doc.joinPath(relativePath),
      onProgress: (stream) {
        stream.listen(
          null,
          onDone: () => completer.complete(null),
          onError: (Object e) => completer.completeError(e),
        );
      },
    );
    return completer.future;
  }
}
