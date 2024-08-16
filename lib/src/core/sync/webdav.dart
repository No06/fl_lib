part of 'base.dart';

const webdav = _Webdav._();

final class WebdavInitArgs {
  final String url;
  final String user;
  final String pwd;
  final String prefix;

  const WebdavInitArgs({
    required this.url,
    required this.user,
    required this.pwd,
    required this.prefix,
  });
}

final class _Webdav implements RemoteStorage<WebdavInitArgs, String> {
  const _Webdav._();

  /// Some WebDAV provider only support non-root path
  static String _prefix = 'gptbox/';

  static String _url = '';

  static WebdavClient _client = WebdavClient(url: _url, user: '', pwd: '');

  @override
  Future<void> init(args) async {
    final url = args.url;
    if (_url == url) return;

    _checkUrl(url);
    await test(url, args.user, args.pwd);
    _url = url;
    _client = WebdavClient(url: url, user: args.user, pwd: args.pwd);
    _prefix = args.prefix;
  }

  static Future<void> test(String url, String user, String pwd) async {
    await WebdavClient(url: url, user: user, pwd: pwd).ping();
  }

  /// Throws exception if URL is invalid
  void _checkUrl([String? url]) {
    url ??= _url;
    final pattern = RegExp(r'^https?://');
    if (url.isEmpty || !pattern.hasMatch(url)) {
      throw 'Invalid URL';
    }
  }

  @override
  Future<void> upload({
    required String relativePath,
    String? localPath,
  }) {
    _checkUrl();
    return _client.writeFile(
      localPath ?? Paths.doc.joinPath(relativePath),
      _prefix + relativePath,
    );
  }

  @override
  Future<void> delete(String relativePath) async {
    _checkUrl();
    return _client.remove(_prefix + relativePath);
  }

  @override
  Future<void> download({
    required String relativePath,
    String? localPath,
  }) {
    _checkUrl();
    return _client.readFile(
      _prefix + relativePath,
      localPath ?? Paths.doc.joinPath(relativePath),
    );
  }

  @override
  Future<List<String>> list() async {
    _checkUrl();
    final list = await _client.readDir(_prefix);
    final names = <String>[];
    for (final item in list) {
      final name = item.name;
      if ((item.isDir ?? true) || name == null) continue;
      names.add(name);
    }
    return names;
  }
}
