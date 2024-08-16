import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class LibLocalizationsZh extends LibLocalizations {
  LibLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get about => '关于';

  @override
  String get add => '添加';

  @override
  String get all => '所有';

  @override
  String askContinue(Object msg) {
    return '$msg，继续吗？';
  }

  @override
  String get attention => '注意';

  @override
  String get authRequired => '需要认证';

  @override
  String get auto => '自动';

  @override
  String get autoCheckUpdate => '自动检查更新';

  @override
  String get backup => '备份';

  @override
  String get bioAuth => '生物认证';

  @override
  String get bright => '亮';

  @override
  String get cancel => '取消';

  @override
  String get clear => '清除';

  @override
  String get clipboard => '剪切板';

  @override
  String get close => '关闭';

  @override
  String get content => '内容';

  @override
  String get copy => '复制';

  @override
  String get dark => '暗';

  @override
  String get day => '天';

  @override
  String get delete => '删除';

  @override
  String get device => '设备';

  @override
  String get disabled => '已禁用';

  @override
  String get doc => '文档';

  @override
  String get dontShowAgain => '不再提示';

  @override
  String get download => '下载';

  @override
  String get edit => '编辑';

  @override
  String get empty => '空';

  @override
  String get error => '错误';

  @override
  String get example => '示例';

  @override
  String get execute => '执行';

  @override
  String get exit => '退出';

  @override
  String get exitConfirmTip => '再次返回以退出';

  @override
  String get export => '导出';

  @override
  String get fail => '失败';

  @override
  String get feedback => '反馈';

  @override
  String get file => '文件';

  @override
  String get fold => '折叠';

  @override
  String get folder => '文件夹';

  @override
  String get hideTitleBar => '隐藏标题栏';

  @override
  String get hour => '时';

  @override
  String get import => '导入';

  @override
  String get key => '键';

  @override
  String get language => '语言';

  @override
  String get log => '日志';

  @override
  String get minute => '分';

  @override
  String get name => '名称';

  @override
  String get network => '网络';

  @override
  String notExistFmt(Object file) {
    return '$file 不存在';
  }

  @override
  String get note => '备注';

  @override
  String get ok => '好';

  @override
  String get open => '打开';

  @override
  String get path => '路径';

  @override
  String get primaryColorSeed => '主题色种子';

  @override
  String get pwd => '密码';

  @override
  String get rename => '重命名';

  @override
  String get restore => '恢复';

  @override
  String get save => '保存';

  @override
  String get second => '秒';

  @override
  String get select => '选择';

  @override
  String get setting => '设置';

  @override
  String get share => '分享';

  @override
  String get success => '成功';

  @override
  String get sync => '同步';

  @override
  String get tag => '标签';

  @override
  String get tapToAuth => '点击以认证';

  @override
  String get themeMode => '主题模式';

  @override
  String get update => '更新';

  @override
  String get user => '用户';

  @override
  String get value => '值';

  @override
  String versionHasUpdate(Object build) {
    return '找到新版本：v1.0.$build, 点击更新';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return '当前：v1.0.$build，点击检查更新';
  }

  @override
  String versionUpdated(Object build) {
    return '当前：v1.0.$build, 已是最新版本';
  }

  @override
  String get yesterday => '昨天';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class LibLocalizationsZhTw extends LibLocalizationsZh {
  LibLocalizationsZhTw(): super('zh_TW');

  @override
  String get about => '關於';

  @override
  String get add => '添加';

  @override
  String get all => '所有';

  @override
  String askContinue(Object msg) {
    return '$msg，繼續嗎？';
  }

  @override
  String get attention => '注意';

  @override
  String get authRequired => '需要認證';

  @override
  String get auto => '自動';

  @override
  String get autoCheckUpdate => '自動檢查更新';

  @override
  String get backup => '備份';

  @override
  String get bioAuth => '生物認證';

  @override
  String get bright => '亮';

  @override
  String get cancel => '取消';

  @override
  String get clear => '清除';

  @override
  String get clipboard => '剪貼簿';

  @override
  String get close => '關閉';

  @override
  String get content => '內容';

  @override
  String get copy => '複製';

  @override
  String get dark => '暗';

  @override
  String get day => '天';

  @override
  String get delete => '刪除';

  @override
  String get device => 'Cihaz';

  @override
  String get disabled => '已禁用';

  @override
  String get doc => '文檔';

  @override
  String get dontShowAgain => '不再顯示';

  @override
  String get download => '下載';

  @override
  String get edit => '編輯';

  @override
  String get empty => '空';

  @override
  String get error => '錯誤';

  @override
  String get example => '範例';

  @override
  String get execute => '執行';

  @override
  String get exit => '退出';

  @override
  String get exitConfirmTip => '再次返回以退出';

  @override
  String get export => '匯出';

  @override
  String get fail => '失敗';

  @override
  String get feedback => '反饋';

  @override
  String get file => '文件';

  @override
  String get fold => '摺疊';

  @override
  String get folder => '資料夾';

  @override
  String get hideTitleBar => '隱藏標題欄';

  @override
  String get hour => '時';

  @override
  String get import => '導入';

  @override
  String get key => '鍵';

  @override
  String get language => '語言';

  @override
  String get log => '日誌';

  @override
  String get minute => '分';

  @override
  String get name => '名稱';

  @override
  String get network => '網絡';

  @override
  String notExistFmt(Object file) {
    return '$file 不存在';
  }

  @override
  String get note => '備註';

  @override
  String get ok => '好';

  @override
  String get open => '打開';

  @override
  String get path => '路徑';

  @override
  String get primaryColorSeed => '主要色調種子';

  @override
  String get pwd => '密碼';

  @override
  String get rename => '重命名';

  @override
  String get restore => '恢復';

  @override
  String get save => '儲存';

  @override
  String get second => '秒';

  @override
  String get select => '選擇';

  @override
  String get setting => '設置';

  @override
  String get share => '分享';

  @override
  String get success => '成功';

  @override
  String get sync => '同步';

  @override
  String get tag => '標籤';

  @override
  String get tapToAuth => '點擊以認證';

  @override
  String get themeMode => '主題模式';

  @override
  String get update => '更新';

  @override
  String get user => '使用者';

  @override
  String get value => '值';

  @override
  String versionHasUpdate(Object build) {
    return '找到新版本：v1.0.$build, 點擊更新';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return '當前：v1.0.$build，點擊檢查更新';
  }

  @override
  String versionUpdated(Object build) {
    return '當前：v1.0.$build, 已是最新版本';
  }

  @override
  String get yesterday => '昨天';
}
