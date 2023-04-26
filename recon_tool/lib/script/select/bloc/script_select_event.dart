part of 'script_select_bloc.dart';

abstract class ScriptSelectEvent extends Equatable {
  const ScriptSelectEvent();

  @override
  List<Object> get props => [];
}

class ScriptSelectRunScript extends ScriptSelectEvent {
  final ReconScript script;
  const ScriptSelectRunScript({required this.script});
}
