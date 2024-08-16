import 'lib_l10n.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class LibLocalizationsPt extends LibLocalizations {
  LibLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get about => 'Sobre';

  @override
  String get add => 'Adicionar';

  @override
  String get all => 'Todos';

  @override
  String askContinue(Object msg) {
    return '$msg, continuar?';
  }

  @override
  String get attention => 'Atenção';

  @override
  String get authRequired => 'Autenticação necessária';

  @override
  String get auto => 'Auto';

  @override
  String get autoCheckUpdate => 'Verificação automática de atualização';

  @override
  String get backup => 'Backup';

  @override
  String get bioAuth => 'Autenticação biométrica';

  @override
  String get bright => 'Claro';

  @override
  String get cancel => 'Cancelar';

  @override
  String get clear => 'Limpar';

  @override
  String get clipboard => 'Área de transferência';

  @override
  String get close => 'Fechar';

  @override
  String get content => 'Conteúdo';

  @override
  String get copy => 'Copiar';

  @override
  String get dark => 'Escuro';

  @override
  String get day => 'Dias';

  @override
  String get delete => 'Excluir';

  @override
  String get device => 'Dispositivo';

  @override
  String get disabled => 'Desativado';

  @override
  String get doc => 'Documentação';

  @override
  String get dontShowAgain => 'Não mostrar novamente';

  @override
  String get download => 'Baixar';

  @override
  String get edit => 'Editar';

  @override
  String get empty => 'Vazio';

  @override
  String get error => 'Erro';

  @override
  String get example => 'Exemplo';

  @override
  String get execute => 'Executar';

  @override
  String get exit => 'Sair';

  @override
  String get exitConfirmTip => 'Pressione voltar novamente para sair';

  @override
  String get export => 'Exportar';

  @override
  String get fail => 'Falha';

  @override
  String get feedback => 'Feedback';

  @override
  String get file => 'Arquivo';

  @override
  String get fold => 'Dobrar';

  @override
  String get folder => 'Pasta';

  @override
  String get hideTitleBar => 'Ocultar barra de título';

  @override
  String get hour => 'Horas';

  @override
  String get import => 'Importar';

  @override
  String get key => 'Chave';

  @override
  String get language => 'Idioma';

  @override
  String get log => 'Log';

  @override
  String get minute => 'Minutos';

  @override
  String get name => 'Nome';

  @override
  String get network => 'Rede';

  @override
  String notExistFmt(Object file) {
    return '$file não existe';
  }

  @override
  String get note => 'Nota';

  @override
  String get ok => 'Ok';

  @override
  String get open => 'Abrir';

  @override
  String get path => 'Caminho';

  @override
  String get primaryColorSeed => 'Semente da cor primária';

  @override
  String get pwd => 'Senha';

  @override
  String get rename => 'Renomear';

  @override
  String get restore => 'Restaurar';

  @override
  String get save => 'Salvar';

  @override
  String get second => 'Segundos';

  @override
  String get select => 'Selecionar';

  @override
  String get setting => 'Configurações';

  @override
  String get share => 'Compartilhar';

  @override
  String get success => 'Sucesso';

  @override
  String get sync => 'Sincronizar';

  @override
  String get tag => 'Etiqueta';

  @override
  String get tapToAuth => 'Clique para verificar';

  @override
  String get themeMode => 'Modo do tema';

  @override
  String get update => 'Atualizar';

  @override
  String get user => 'Usuário';

  @override
  String get value => 'Valor';

  @override
  String versionHasUpdate(Object build) {
    return 'Nova versão encontrada: v1.0.$build, clique para atualizar';
  }

  @override
  String versionUnknownUpdate(Object build) {
    return 'Versão atual: v1.0.$build, clique para verificar atualizações';
  }

  @override
  String versionUpdated(Object build) {
    return 'Versão atual: v1.0.$build, já está atualizado';
  }

  @override
  String get yesterday => 'Ontem';
}
