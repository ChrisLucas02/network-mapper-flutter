import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recon_tool/model/host.dart';
import 'package:recon_tool/model/script.dart';
import 'package:recon_tool/script/home/bloc/script_home_bloc.dart';
import 'package:recon_tool/script/home/bloc/script_home_event.dart';
import 'package:recon_tool/widgets/recon_content_spacing.dart';
import 'package:recon_tool/widgets/recon_return_btn.dart';

class ScriptSelectView extends StatelessWidget {
  final ReconScript script;

  const ScriptSelectView({
    super.key,
    required this.script,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: Column(
        children: [
          ReconReturnButton(action: () {
            context.read<ScriptHomeBloc>().add(const ScriptHomeLoadScripts());
          }),
          ContentSpacing(
            priority: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  script.description,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                const Divider(
                  indent: 10.0,
                  thickness: 2.0,
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        script.cmd,
                        style: TextStyle(fontSize: 18),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "x.x.x.x/yz",
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final result =
                              """# Nmap 7.93 scan initiated Mon Apr 24 21:29:36 2023 as: nmap -oG - 172.20.10.0/24
Host: 172.20.10.1 ()	Status: Up
Host: 172.20.10.1 ()	Ports: 21/open/tcp//ftp///, 53/open/tcp//domain///, 49152/open/tcp//unknown///, 49154/open/tcp//unknown///, 62078/open/tcp//iphone-sync///	Ignored State: closed (995)
Host: 172.20.10.2 ()	Status: Up
Host: 172.20.10.2 ()	Ports: 5000/open/tcp//upnp///, 7000/open/tcp//afs3-fileserver///	Ignored State: closed (998)
# Nmap done at Mon Apr 24 21:30:01 2023 -- 256 IP addresses (2 hosts up) scanned in 24.85 seconds""";
                          parseNmap1(result);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Start Scan"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //ScannedHost a = script.result[0];
                          //  print(a.port);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Start Scan"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void parseNmap1(String result) {
    print("start");
    const splitter = LineSplitter();

    final lines = splitter.convert(result);
    final firstTest = RegExp(
        r'(?=Host).*\b((([0-2]\d[0-5])|(\d{2})|(\d))\.){3}(([0-2]\d[0-5])|(\d{2})|(\d))\b.*(Up)');
    final secondTest = RegExp(
        r'\b((([0-2]\d[0-5])|(\d{2})|(\d))\.){3}(([0-2]\d[0-5])|(\d{2})|(\d))');
    final thirdTest = RegExp(r'[0-9]+\/{1}open\/(tcp|udp)\/{2}[a-z\-0-9]+');
    var checkNextLine = false;
    for (var line in lines) {
      if (line.startsWith('#')) continue;
      if (checkNextLine) {
        final matches = secondTest.firstMatch(line);
        if (matches == null) {
          continue;
        }
        final matches2 = thirdTest.allMatches(line);
        for (var match in matches2) {
          final values = match[0]!.split("/");
          print(match[0]);
          // convert to object
          final result = ScannedHost(
            port: int.parse(values[0]),
            hint: values[3],
            portType: values[2] == "tcp" ? PortType.tcp : PortType.udp,
            isOpen: values[1] == "open",
          );
          script.result.add(result);
        }
        print(matches[0]);
        checkNextLine = false;
      }
      if (firstTest.hasMatch(line)) {
        checkNextLine = true;
      }
    }
    print("done");
  }
}
