part of 'script_select_bloc.dart';

enum ScriptSelectStatus {
  initial,
  running,
  success,
  error,
}

class ScriptSelectState extends Equatable {
  final ScriptSelectStatus status;
  final ReconScript script;
  final String error;

  const ScriptSelectState({
    this.status = ScriptSelectStatus.initial,
    required this.script,
    this.error = "",
  });

  @override
  List<Object?> get props => [
        status,
        script,
        error,
      ];

  ScriptSelectState copyWith({
    ScriptSelectStatus? status,
    ReconScript? script,
    String? error,
  }) {
    return ScriptSelectState(
      status: status ?? this.status,
      script: script ?? this.script,
      error: error ?? this.error,
    );
  }
}
