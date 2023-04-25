import 'package:flutter/material.dart';

class ContentSpacing extends StatelessWidget {
  final Widget child;
  final int? priority;
  const ContentSpacing({
    Key? key,
    required this.child,
    this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            WhiteSpace(isActive: constraints.biggest.width > 900),
            Expanded(
              flex: priority ?? 1,
              child: child,
            ),
            WhiteSpace(isActive: constraints.biggest.width > 900),
          ],
        );
      },
    );
  }
}

class WhiteSpace extends StatelessWidget {
  final bool isActive;
  const WhiteSpace({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return const Expanded(
        child: SizedBox.shrink(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
