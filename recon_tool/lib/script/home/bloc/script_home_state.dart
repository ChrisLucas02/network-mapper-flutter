import 'package:equatable/equatable.dart';
import 'package:recon_tool/model/script.dart';

enum ScriptHomeStatus { initial, loading, home, select, failed }

class ScriptHomeState extends Equatable {
  final ScriptHomeStatus status;
  final List<ReconScript> scripts;
  final ReconScript? script;
  final String error;

  const ScriptHomeState({
    this.status = ScriptHomeStatus.initial,
    this.scripts = const [],
    this.script,
    this.error = "",
  });

  @override
  List<Object?> get props => [
        status,
        script,
        scripts,
        error,
      ];

  ScriptHomeState copyWith({
    ScriptHomeStatus? status,
    List<ReconScript>? scripts,
    ReconScript? script,
    String? error,
  }) {
    return ScriptHomeState(
      status: status ?? this.status,
      scripts: scripts ?? this.scripts,
      script: script ?? this.script,
      error: error ?? this.error,
    );
  }
}
