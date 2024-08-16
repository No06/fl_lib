import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class LibLocalizationsJa extends LibLocalizations {
  LibLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get about => '約';

  @override
  String get add => '追加';

  @override
  String get all => '全て';

  @override
  String askContinue(Object msg) {
    return '$msg、続行しますか？';
  }

  @override
  String get attention => '注意';

  @override
  String get authRequired => '認証が必要';

  @override
  String get auto => '自動';

  @override
  String get autoCheckUpdate => '自動的に更新をチェック';

  @override
  String get backup => 'バックアップ';

  @override
  String get bioAuth => '生体認証';

  @override
  String get bright => '明るい';

  @override
  String get cancel => 'キャンセル';

  @override
  String get clear => 'クリア';

  @override
  String get clipboard => 'クリップボード';

  @override
  String get close => '閉じる';

  @override
  String get content => 'コンテンツ';

  @override
  String get copy => 'コピーする';

  @override
  String get dark => '暗い';

  @override
  String get day => '日';

  @override
  String get delete => '削除';

  @override
  String get device => '装置';

  @override
  String get disabled => '無効';

  @override
  String get doc => 'ドキュメント';

  @override
  String get dontShowAgain => '今後表示しない';

  @override
  String get download => 'ダウンロード';

  @override
  String get edit => '編集';

  @override
  String get empty => '空';

  @override
  String get error => 'エラー';

  @override
  String get example => '例';

  @override
  String get execute => '実行';

  @override
  String get exit => '終了';

  @override
  String get exitConfirmTip => 'もう一度戻ると終了します';

  @override
  String get export => 'エクスポート';

  @override
  String get fail => '失敗';

  @override
  String get feedback => 'フィードバック';

  @override
  String get file => 'ファイル';

  @override
  String get fold => '折る';

  @override
  String get folder => 'フォルダ';

  @override
  String get hideTitleBar => 'タイトルバーを非表示にする';

  @override
  String get hour => '時間';

  @override
  String get import => 'インポート';

  @override
  String get key => 'キー';

  @override
  String get language => '言語';

  @override
  String get log => 'ログ';

  @override
  String get minute => '分';

  @override
  String get name => '名前';

  @override
  String get network => 'ネットワーク';

  @override
  String notExistFmt(Object file) {
    return '$fileは存在しません';
  }

  @override
  String get note => 'メモ';

  @override
  String get ok => 'いいです';

  @override
  String get open => '開く';

  @override
  String get path => 'パス';

  @override
  String get primaryColorSeed => 'プライマリーカラーシード';

  @override
  String get pwd => 'パスワード';

  @override
  String get rename => '名前変更';

  @override
  String get restore => 'リストア';

  @override
  String get save => '保存';

  @override
  String get second => '秒';

  @override
  String get select => '選択';

  @override
  String get setting => '設定';

  @override
  String get share => '共有';

  @override
  String get success => '成功';

  @override
  String get sync => '同期';

  @override
  String get tag => 'タグ';

  @override
  String get tapToAuth => '認証するにはクリックしてください';

  @override
  String get themeMode => 'テーマモード';

  @override
  String get update => '更新';

  @override
  String get user => 'ユーザー';

  @override
  String get value => '値';

  @override
  String versionHasUpdate(Object build) {
    return '新しいバージョンが見つかりました：v1.0.$build、クリックして更新';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return 'Huidig: v1.0.$build, klik om te kijken naar een nieuwere versie';
  }

  @override
  String versionUpdated(Object build) {
    return '現在：v1.0.$build、最新バージョンです';
  }

  @override
  String get yesterday => '昨日';
}
