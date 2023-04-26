enum PortType {
  tcp,
  udp,
}

class ScannedHost {
  final int port;
  final String hint;
  final PortType portType;
  final bool isOpen;

  ScannedHost({
    required this.port,
    required this.hint,
    required this.portType,
    required this.isOpen,
  });
}
