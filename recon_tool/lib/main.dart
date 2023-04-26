import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recon_tool/recon_app.dart';
import 'package:recon_tool/recon_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //DesktopWindow.setMinWindowSize(const Size(960, 540));
  //DesktopWindow.setMaxWindowSize(Size.infinite);

  runApp(RepositoryProvider.value(
    value: ReconRepository(),
    child: const ReconApp(),
  ));
}
