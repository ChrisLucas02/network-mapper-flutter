import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recon_tool/app/recon_viewmodel.dart';
import 'package:recon_tool/script/home/view/script_home_view.dart';

import '../script/home/view/script_view.dart';

class ReconContent extends StatefulWidget {
  const ReconContent({super.key});

  @override
  State<ReconContent> createState() => _ReconContentState();
}

class _ReconContentState extends State<ReconContent> {
  @override
  Widget build(BuildContext context) {
    return const ScriptView();

    /*final viewmodel = context.watch<ReconViewModel>();
    switch (viewmodel.state) {
      case AppState.script:
        return const ScriptHomeView();
    }*/
  }
}
