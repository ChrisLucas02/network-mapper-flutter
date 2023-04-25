import 'package:equatable/equatable.dart';
import 'package:recon_tool/model/script.dart';

abstract class ScriptHomeEvent extends Equatable {
  const ScriptHomeEvent();

  @override
  List<Object> get props => [];
}

class ScriptHomeSelectScript extends ScriptHomeEvent {
  final ReconScript script;
  const ScriptHomeSelectScript({required this.script});
}

class ScriptHomeLoadScripts extends ScriptHomeEvent {
  const ScriptHomeLoadScripts();
}
