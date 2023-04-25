import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recon_tool/model/script.dart';
import 'package:recon_tool/script/home/bloc/script_home_bloc.dart';
import 'package:recon_tool/script/home/bloc/script_home_event.dart';

class ScriptHomeContent extends StatelessWidget {
  final List<ReconScript> list;

  const ScriptHomeContent({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: ListView(
        children: <Widget>[
          DataTable(
            showCheckboxColumn: false,
            columns: const [
              DataColumn(
                numeric: true,
                label: Text(
                  'ID',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                numeric: true,
                label: Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Script Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: list
                .map(
                  ((e) => DataRow(
                        onSelectChanged: (value) {
                          context
                              .read<ScriptHomeBloc>()
                              .add(ScriptHomeSelectScript(script: e));
                        },
                        cells: <DataCell>[
                          DataCell(Text(e.id.toString())),
                          DataCell(Text(e.type.name)),
                          DataCell(Text(e.description)),
                        ],
                      )),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
