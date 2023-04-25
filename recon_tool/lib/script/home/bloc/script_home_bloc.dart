import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recon_tool/recon_repository.dart';
import 'package:recon_tool/script/home/bloc/script_home_event.dart';
import 'package:recon_tool/script/home/bloc/script_home_state.dart';

class ScriptHomeBloc extends Bloc<ScriptHomeEvent, ScriptHomeState> {
  final ReconRepository _reconRepository;

  ScriptHomeBloc({required ReconRepository reconRepository})
      : _reconRepository = reconRepository,
        super(const ScriptHomeState()) {
    // Setting functions to the events
    on<ScriptHomeSelectScript>(_selectScript);
    on<ScriptHomeLoadScripts>(_loadScripts);
  }

  Future<void> _selectScript(
    ScriptHomeSelectScript event,
    Emitter<ScriptHomeState> emit,
  ) async {
    emit(state.copyWith(
      script: event.script,
      status: ScriptHomeStatus.select,
    ));
  }

  void _loadScripts(
    ScriptHomeLoadScripts event,
    Emitter<ScriptHomeState> emit,
  ) {
    try {
      emit(state.copyWith(
        status: ScriptHomeStatus.loading,
      ));

      final scripts = _reconRepository.reconsScripts;
      emit(state.copyWith(
        scripts: scripts,
        status: ScriptHomeStatus.home,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ScriptHomeStatus.failed,
      ));
    }
  }
}
