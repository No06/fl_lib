import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class LibLocalizationsFr extends LibLocalizations {
  LibLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get about => 'À propos';

  @override
  String get add => 'Ajouter';

  @override
  String get all => 'Tous';

  @override
  String askContinue(Object msg) {
    return '$msg. Continuer?';
  }

  @override
  String get attention => 'Attention';

  @override
  String get authRequired => 'Authentification requise';

  @override
  String get auto => 'Auto';

  @override
  String get autoCheckUpdate => 'Vérification automatique des mises à jour';

  @override
  String get backup => 'Sauvegarder';

  @override
  String get bioAuth => 'Authentification biométrique';

  @override
  String get bright => 'Clair';

  @override
  String get cancel => 'Annuler';

  @override
  String get clear => 'Effacer';

  @override
  String get clipboard => 'Presse-papiers';

  @override
  String get close => 'Fermer';

  @override
  String get content => 'Contenu';

  @override
  String get copy => 'Copier';

  @override
  String get dark => 'Sombre';

  @override
  String get day => 'Jours';

  @override
  String get delete => 'Supprimer';

  @override
  String get device => 'Appareil';

  @override
  String get disabled => 'Désactivé';

  @override
  String get doc => 'Documentation';

  @override
  String get dontShowAgain => 'Ne plus afficher';

  @override
  String get download => 'Télécharger';

  @override
  String get edit => 'Éditer';

  @override
  String get empty => 'Vide';

  @override
  String get error => 'Erreur';

  @override
  String get example => 'Exemple\n';

  @override
  String get execute => 'Exécuter';

  @override
  String get exit => 'Quitter';

  @override
  String get exitConfirmTip => 'Appuyez à nouveau sur retour pour quitter';

  @override
  String get export => 'Exporter';

  @override
  String get fail => 'Échec';

  @override
  String get feedback => 'Retour';

  @override
  String get file => 'Fichier';

  @override
  String get fold => 'Plier';

  @override
  String get folder => 'Dossier';

  @override
  String get hideTitleBar => 'Masquer la barre de titre';

  @override
  String get hour => 'Heures';

  @override
  String get import => 'Importer';

  @override
  String get key => 'Clé';

  @override
  String get language => 'Langue';

  @override
  String get log => 'Journal';

  @override
  String get minute => 'Minutes';

  @override
  String get name => 'Nom';

  @override
  String get network => 'Réseau';

  @override
  String notExistFmt(Object file) {
    return '$file n\'existe pas';
  }

  @override
  String get note => 'Note';

  @override
  String get ok => 'D\'accord';

  @override
  String get open => 'Ouvrir';

  @override
  String get path => 'Chemin';

  @override
  String get primaryColorSeed => 'Graine de couleur primaire';

  @override
  String get pwd => 'Mot de passe';

  @override
  String get rename => 'Renommer';

  @override
  String get restore => 'Restaurer';

  @override
  String get save => 'Enregistrer';

  @override
  String get second => 'Secondes';

  @override
  String get select => 'Sélectionner';

  @override
  String get setting => 'Paramètres';

  @override
  String get share => 'Partager';

  @override
  String get success => 'Succès';

  @override
  String get sync => 'Synchroniser';

  @override
  String get tag => 'Étiquette';

  @override
  String get tapToAuth => 'Cliquez pour vérifier';

  @override
  String get themeMode => 'Mode thème';

  @override
  String get update => 'Mettre à jour';

  @override
  String get user => 'Utilisateur';

  @override
  String get value => 'Valeur';

  @override
  String versionHasUpdate(Object build) {
    return 'Trouvé : v1.0.$build, cliquez pour mettre à jour';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return 'Actuelle : v1.0.$build, cliquez pour vérifier les mises à jour';
  }

  @override
  String versionUpdated(Object build) {
    return 'Actuelle : v1.0.$build, est à jour';
  }

  @override
  String get yesterday => 'Hier';
}
