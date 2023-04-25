import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recon_tool/script/home/bloc/script_home_bloc.dart';
import 'package:recon_tool/script/home/bloc/script_home_event.dart';
import 'package:recon_tool/script/home/bloc/script_home_state.dart';
import 'package:recon_tool/script/home/view/script_home_view.dart';
import 'package:recon_tool/script/select/view/script_select_view.dart';

import '../../../recon_repository.dart';

class ScriptView extends StatelessWidget {
  const ScriptView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ScriptHomeBloc(
              reconRepository: context.read<ReconRepository>(),
            )..add(const ScriptHomeLoadScripts()),
        child: const ScriptContent());
  }
}

class ScriptContent extends StatelessWidget {
  const ScriptContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScriptHomeBloc, ScriptHomeState>(
        builder: (context, state) {
      switch (state.status) {
        case ScriptHomeStatus.initial:
          return Column();
        case ScriptHomeStatus.loading:
          return Column();
        case ScriptHomeStatus.home:
          return ScriptHomeContent(
            list: state.scripts,
          );
        case ScriptHomeStatus.select:
          return ScriptSelectView(
            script: state.script!,
          );
        case ScriptHomeStatus.failed:
          return Expanded(
            child: Column(),
          );
      }
    });
  }
}
