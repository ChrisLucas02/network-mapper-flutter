import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          final a = await Process.run(script.cmd, [
                            script.args.entries.first.key,
                            script.args.entries.first.value
                          ]);
                          print("start");
                          print(a.stdout);
                          print("done");
                          final outss = a.stdout;
                          final splitter = LineSplitter();
                          final ifs = splitter.convert(outss);
                          print(ifs);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Start Scan"),
                        ),
                      )
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
}
