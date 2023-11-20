import 'package:mobx/mobx.dart';
import 'package:music_app/adicionar_musicas/repositories/adicionar_musicas_repository.dart';
import '../../criar_nova_musica/models/music_model.dart';
part 'adicionar_musicas_controller.g.dart';

class AdicionarMusicasController = AdicionarMusicasControllerBase
    with _$AdicionarMusicasController;

  enum AdicionarMusicasStateStatus {
  initial,
  loading,
  loaded,
  error,
  updateScreen,
}

abstract class AdicionarMusicasControllerBase with Store {
  final AdicionarMusicasRepository adicionarMusicasRepository;

  final List<String> generosMusicais = [
    'Selecione um gênero',
    'Variados',
    'Rock',
    'Pop',
    'Hip Hop',
    'Eletrônica',
    'Jazz',
    'Clássica',
    'Sertanejo',
    'Funk',
    'Reggae',
    'Blues',
  ];
  
  @readonly
  String _selectedGenre = 'Selecione um gênero';

  AdicionarMusicasControllerBase(this.adicionarMusicasRepository);

  @action
  void selecionarGenero(String generoSelecionado) {
    _selectedGenre = generoSelecionado;
  }


  @readonly
  var _lstMusicas = <MusicModel>[];

  @readonly
  var _status =  AdicionarMusicasStateStatus.initial;


  @action
  Future<void> getMusicasPorId(int nmMusica) async {
    try {
      _status = AdicionarMusicasStateStatus.loaded;
      await Future<void>.delayed(Duration.zero);
      _lstMusicas = await adicionarMusicasRepository.getMusicasPorId();
      _status = AdicionarMusicasStateStatus.updateScreen;
    } catch (e) {
      if (_lstMusicas.isEmpty) {
        _lstMusicas = [];
      }
       _status = AdicionarMusicasStateStatus.error;
      throw Exception('Erro ao buscar grupo');
    }
  }

  
}
