import 'package:flutter/material.dart';
import 'package:nexai/core/theme/colors.dart';
import 'package:nexai/core/theme/text_styles.dart';

class BootstrapHome extends StatelessWidget {
  const BootstrapHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<NexColors>()!;

    return Center(
      child: Text(
        'NEXAI',
        style: AppTextStyles.headline.copyWith(color: colors.textPrimary),
      ),
    );
  }
}
