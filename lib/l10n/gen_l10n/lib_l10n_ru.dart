import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LibLocalizationsRu extends LibLocalizations {
  LibLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get about => 'о';

  @override
  String get add => 'Добавить';

  @override
  String get all => 'Все';

  @override
  String askContinue(Object msg) {
    return '$msg, продолжить?';
  }

  @override
  String get attention => 'Внимание';

  @override
  String get authRequired => 'Требуется аутентификация';

  @override
  String get auto => 'авто';

  @override
  String get autoCheckUpdate => 'авто проверка обновлений';

  @override
  String get backup => 'Резервное копирование';

  @override
  String get bioAuth => 'Биометрическая аутентификация';

  @override
  String get bright => 'Светлый';

  @override
  String get cancel => 'Отмена';

  @override
  String get clear => 'Очистить';

  @override
  String get clipboard => 'Буфер обмена';

  @override
  String get close => 'закрыть';

  @override
  String get content => 'Содержимое';

  @override
  String get copy => 'Копировать';

  @override
  String get dark => 'Темный';

  @override
  String get day => 'Дни';

  @override
  String get delete => 'Удалить';

  @override
  String get device => 'Устройство';

  @override
  String get disabled => 'отключено';

  @override
  String get doc => 'Документация';

  @override
  String get dontShowAgain => 'Больше не показывать';

  @override
  String get download => 'скачать';

  @override
  String get edit => 'Редактировать';

  @override
  String get empty => 'Пусто';

  @override
  String get error => 'Ошибка';

  @override
  String get example => 'Пример';

  @override
  String get execute => 'Выполнить';

  @override
  String get exit => 'Выйти';

  @override
  String get exitConfirmTip => 'Нажмите назад еще раз, чтобы выйти';

  @override
  String get export => 'экспорт';

  @override
  String get fail => 'Неудача';

  @override
  String get feedback => 'обратная связь';

  @override
  String get file => 'Файл';

  @override
  String get fold => 'Складывать';

  @override
  String get folder => 'Папка';

  @override
  String get hideTitleBar => 'Скрыть строку заголовка';

  @override
  String get hour => 'Часы';

  @override
  String get import => 'Импортировать';

  @override
  String get key => 'Ключ';

  @override
  String get language => 'язык';

  @override
  String get log => 'лог';

  @override
  String get minute => 'Минуты';

  @override
  String get name => 'Имя';

  @override
  String get network => 'Сеть';

  @override
  String notExistFmt(Object file) {
    return '$file не существует';
  }

  @override
  String get note => 'заметка';

  @override
  String get ok => 'Хорошо';

  @override
  String get open => 'Открыть';

  @override
  String get path => 'путь';

  @override
  String get primaryColorSeed => 'основной цветовой тон';

  @override
  String get pwd => 'Пароль';

  @override
  String get rename => 'Переименовать';

  @override
  String get restore => 'Восстановление';

  @override
  String get save => 'Сохранить';

  @override
  String get second => 'Секунды';

  @override
  String get select => 'Выбрать';

  @override
  String get setting => 'настройки';

  @override
  String get share => 'Поделиться';

  @override
  String get success => 'Успех';

  @override
  String get sync => 'Синхронизировать';

  @override
  String get tag => 'Тег';

  @override
  String get tapToAuth => 'Нажмите для подтверждения';

  @override
  String get themeMode => 'режим темы';

  @override
  String get update => 'Обновить';

  @override
  String get user => 'пользователь';

  @override
  String get value => 'значение';

  @override
  String versionHasUpdate(Object build) {
    return 'Найдена новая версия: v1.0.$build, нажмите для обновления';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return 'Текущая: v1.0.$build, нажмите для проверки обновлений';
  }

  @override
  String versionUpdated(Object build) {
    return 'Текущая: v1.0.$build, последняя версия';
  }

  @override
  String get yesterday => 'Вчера';
}
