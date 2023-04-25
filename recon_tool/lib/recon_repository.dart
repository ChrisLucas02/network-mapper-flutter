import 'package:recon_tool/model/script.dart';

class ReconRepository {
  final List<ReconScript> reconsScripts = [
    ReconScript(
      id: 1,
      description: 'Scan for all the ip address with an active host',
      type: ReconScriptType.hosts,
      cmd: "nmap",
      args: {"-sV": "192.168.1.0/24"},
    ),
    ReconScript(
        id: 2,
        description: 'Scan for all the vulnerabilities on network hosts',
        type: ReconScriptType.vulnerabilities,
        cmd: "echo",
        args: {"avx": ""})
  ];
}
