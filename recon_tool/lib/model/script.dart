enum ReconScriptType {
  hosts,
  vulnerabilities,
}

class ReconScript {
  final int id;
  final String description;
  final ReconScriptType type;
  final String cmd;
  Map<String, String> args = {};

  ReconScript({
    required this.id,
    required this.description,
    required this.type,
    required this.cmd,
    required this.args,
  });
}
