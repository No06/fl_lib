import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LibLocalizationsEs extends LibLocalizations {
  LibLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get about => 'Acerca de';

  @override
  String get add => 'Añadir';

  @override
  String get all => 'Todos';

  @override
  String askContinue(Object msg) {
    return '$msg, ¿continuar?';
  }

  @override
  String get attention => 'Atención';

  @override
  String get authRequired => 'Autenticación requerida';

  @override
  String get auto => 'Auto';

  @override
  String get autoCheckUpdate => 'Verificación automática de actualizaciones';

  @override
  String get backup => 'Copia de seguridad';

  @override
  String get bioAuth => 'Autenticación biométrica';

  @override
  String get bright => 'Brillante';

  @override
  String get cancel => 'Cancelar';

  @override
  String get clear => 'Limpiar';

  @override
  String get clipboard => 'Portapapeles';

  @override
  String get close => 'Cerrar';

  @override
  String get content => 'Contenido';

  @override
  String get copy => 'Copiar';

  @override
  String get dark => 'Oscuro';

  @override
  String get day => 'Días';

  @override
  String get delete => 'Eliminar';

  @override
  String get device => 'Dispositivo';

  @override
  String get disabled => 'Deshabilitado';

  @override
  String get doc => 'Documentación';

  @override
  String get dontShowAgain => 'No mostrar más';

  @override
  String get download => 'Descargar';

  @override
  String get edit => 'Editar';

  @override
  String get empty => 'Vacío';

  @override
  String get error => 'Error';

  @override
  String get example => 'Ejemplo';

  @override
  String get execute => 'Ejecutar';

  @override
  String get exit => 'Salir';

  @override
  String get exitConfirmTip => 'Presiona atrás nuevamente para salir';

  @override
  String get export => 'Exportar';

  @override
  String get fail => 'Fracaso';

  @override
  String get feedback => 'Retroalimentación';

  @override
  String get file => 'Archivo';

  @override
  String get fold => 'Doblar';

  @override
  String get folder => 'Carpeta';

  @override
  String get hideTitleBar => 'Ocultar barra de título';

  @override
  String get hour => 'Horas';

  @override
  String get import => 'Importar';

  @override
  String get key => 'Clave';

  @override
  String get language => 'Idioma';

  @override
  String get log => 'Registro';

  @override
  String get minute => 'Minutos';

  @override
  String get name => 'Nombre';

  @override
  String get network => 'Red';

  @override
  String notExistFmt(Object file) {
    return '$file no existe';
  }

  @override
  String get note => 'Nota';

  @override
  String get ok => 'Bien';

  @override
  String get open => 'Abrir';

  @override
  String get path => 'Ruta';

  @override
  String get primaryColorSeed => 'Semilla de color primario';

  @override
  String get pwd => 'Contraseña';

  @override
  String get rename => 'Renombrar';

  @override
  String get restore => 'Restaurar';

  @override
  String get save => 'Guardar';

  @override
  String get second => 'Segundos';

  @override
  String get select => 'Seleccionar';

  @override
  String get setting => 'Configuración';

  @override
  String get share => 'Compartir';

  @override
  String get success => 'Éxito';

  @override
  String get sync => 'Sincronizar';

  @override
  String get tag => 'Etiqueta';

  @override
  String get tapToAuth => 'Haga clic para verificar';

  @override
  String get themeMode => 'Modo de tema';

  @override
  String get update => 'Actualizar';

  @override
  String get user => 'Usuario';

  @override
  String get value => 'Valor';

  @override
  String versionHasUpdate(Object build) {
    return 'Nueva versión encontrada: v1.0.$build, haz clic para actualizar';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return 'Actual: v1.0.$build, haz clic para verificar actualizaciones';
  }

  @override
  String versionUpdated(Object build) {
    return 'Actual: v1.0.$build, ya estás en la última versión';
  }

  @override
  String get yesterday => 'Ayer';
}
