import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recon_tool/model/script.dart';
import 'package:recon_tool/recon_repository.dart';

part 'script_select_event.dart';
part 'script_select_state.dart';

class ScriptSelectBloc extends Bloc<ScriptSelectEvent, ScriptSelectState> {
  final ReconScript script;
  final ReconRepository _reconRepository;

  ScriptSelectBloc({
    required ReconRepository reconRepository,
    required this.script,
  })  : _reconRepository = reconRepository,
        super(ScriptSelectState(script: script)) {
    on<ScriptSelectRunScript>(_runScript);
  }

  Future<void> _runScript(
    ScriptSelectRunScript event,
    Emitter<ScriptSelectState> emit,
  ) async {}
}
