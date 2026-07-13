import 'package:flutter/material.dart';
import 'package:nexai/core/constants/durations.dart';

/// Entrada compartida (fade + scale) para menús flotantes basados en
/// Overlay (NexDropdown, NexContextMenu), para no duplicar la misma
/// animación en cada uno.
class NexMenuEntrance extends StatefulWidget {
  const NexMenuEntrance({super.key, required this.child});

  final Widget child;

  @override
  State<NexMenuEntrance> createState() => _NexMenuEntranceState();
}

class _NexMenuEntranceState extends State<NexMenuEntrance> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) setState(() => _isVisible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1 : 0,
      duration: AppDurations.fast,
      child: AnimatedScale(
        scale: _isVisible ? 1 : 0.95,
        duration: AppDurations.fast,
        alignment: Alignment.topCenter,
        child: widget.child,
      ),
    );
  }
}
