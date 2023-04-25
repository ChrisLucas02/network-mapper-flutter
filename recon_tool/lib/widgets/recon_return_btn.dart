import 'package:flutter/material.dart';

class ReconReturnButton extends StatelessWidget {
  final void Function() action;
  const ReconReturnButton({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0),
        ),
        onPressed: action,
        icon: const Icon(Icons.arrow_back_ios),
        label: const Text("Back"),
      ),
    );
  }
}
