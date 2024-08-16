import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class LibLocalizationsDe extends LibLocalizations {
  LibLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get about => 'Über';

  @override
  String get add => 'Hinzufügen';

  @override
  String get all => 'Alle';

  @override
  String askContinue(Object msg) {
    return '$msg. Weiter?';
  }

  @override
  String get attention => 'Achtung';

  @override
  String get authRequired => 'Authentifizierung erforderlich';

  @override
  String get auto => 'Auto';

  @override
  String get autoCheckUpdate => 'Aktualisierung automatisch prüfen';

  @override
  String get backup => 'Sichern';

  @override
  String get bioAuth => 'Biometrische Authentifizierung';

  @override
  String get bright => 'Hell';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get clear => 'Löschen';

  @override
  String get clipboard => 'Zwischenablage';

  @override
  String get close => 'Schließen';

  @override
  String get content => 'Inhalt';

  @override
  String get copy => 'Kopieren';

  @override
  String get dark => 'Dunkel';

  @override
  String get day => 'Tage';

  @override
  String get delete => 'Löschen';

  @override
  String get device => 'Gerät';

  @override
  String get disabled => 'Behinderte';

  @override
  String get doc => 'Dokumentation';

  @override
  String get dontShowAgain => 'Nicht mehr zeigen';

  @override
  String get download => 'Download';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get empty => 'Leer';

  @override
  String get error => 'Fehler';

  @override
  String get example => 'Beispiel';

  @override
  String get execute => 'Ausführen';

  @override
  String get exit => 'Beenden';

  @override
  String get exitConfirmTip => 'Noch einmal zurück, um zu beenden';

  @override
  String get export => 'Export';

  @override
  String get fail => 'Fehlschlag';

  @override
  String get feedback => 'Feedback';

  @override
  String get file => 'Datei';

  @override
  String get fold => 'Falten';

  @override
  String get folder => 'Ordner';

  @override
  String get hideTitleBar => 'Titelleiste ausblenden';

  @override
  String get hour => 'Stunden';

  @override
  String get import => 'Importieren';

  @override
  String get key => 'Schlüssel';

  @override
  String get language => 'Sprache';

  @override
  String get log => 'Log';

  @override
  String get minute => 'Minuten';

  @override
  String get name => 'Name';

  @override
  String get network => 'Netzwerk';

  @override
  String notExistFmt(Object file) {
    return '$file existiert nicht';
  }

  @override
  String get note => 'Hinweis';

  @override
  String get ok => 'Gut';

  @override
  String get open => 'Öffnen';

  @override
  String get path => 'Pfad';

  @override
  String get primaryColorSeed => 'Farbschema';

  @override
  String get pwd => 'Passwort';

  @override
  String get rename => 'Umbenennen';

  @override
  String get restore => 'Wiederherstellen';

  @override
  String get save => 'Speichern';

  @override
  String get second => 'Sekunden';

  @override
  String get select => 'Auswählen';

  @override
  String get setting => 'Einstellungen';

  @override
  String get share => 'Teilen';

  @override
  String get success => 'Erfolg';

  @override
  String get sync => 'Synchronisieren';

  @override
  String get tag => 'Etikett';

  @override
  String get tapToAuth => 'Zum Bestätigen klicken';

  @override
  String get themeMode => 'Themen-Modus';

  @override
  String get update => 'Aktualisieren';

  @override
  String get user => 'Benutzer';

  @override
  String get value => 'Wert';

  @override
  String versionHasUpdate(Object build) {
    return 'Gefunden: v1.0.$build, klicke zum Aktualisieren';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return 'Aktuell: v1.0.$build. Klicken Sie hier, um nach Updates zu suchen';
  }

  @override
  String versionUpdated(Object build) {
    return 'v1.0.$build ist bereits die neueste Version';
  }

  @override
  String get yesterday => 'Gestern';
}
